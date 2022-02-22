{-# options_haddock prune #-}

-- |Test Interpreters, Internal
module Polysemy.Test.Run where

import qualified Control.Exception as Base
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Except (ExceptT (ExceptT))
import qualified Control.Monad.Trans.Writer.Lazy as MTL
import qualified Data.Text as Text
import GHC.Stack (callStack)
import GHC.Stack.Types (SrcLoc (SrcLoc, srcLocFile), getCallStack, srcLocModule)
import Hedgehog.Internal.Property (Failure, Journal, TestT (TestT), failWith)
import Path (Abs, Dir, Path, parseAbsDir, parseRelDir, (</>))
import Path.IO (canonicalizePath, createTempDir, getCurrentDir, getTempDir, removeDirRecur)
import System.IO.Error (IOError)

import Polysemy.Test.Data.Hedgehog (Hedgehog, liftH)
import qualified Polysemy.Test.Data.Test as Test
import Polysemy.Test.Data.Test (Test)
import Polysemy.Test.Data.TestError (TestError (TestError))
import qualified Polysemy.Test.Files as Files
import Polysemy.Test.Hedgehog (rewriteHedgehog)

ignoringIOErrors ::
  IO () ->
  IO ()
ignoringIOErrors ioe =
  Base.catch ioe handler
  where
    handler :: Monad m => IOError -> m ()
    handler =
      const unit

interpretTestIn' ::
  Member (Embed IO) r =>
  Path Abs Dir ->
  Path Abs Dir ->
  InterpreterFor Test r
interpretTestIn' base tempBase =
  interpret \case
    Test.TestDir ->
      pure base
    Test.TempDir path ->
      Files.tempDir tempBase path
    Test.TempFile content path ->
      Files.tempFile tempBase content path
    Test.TempFileContent path ->
      Files.tempFileContent tempBase path
    Test.FixturePath path ->
      Files.fixturePath base path
    Test.Fixture path ->
      Files.fixture base path

createTemp ::
  Members [Error TestError, Embed IO] r =>
  Sem r (Path Abs Dir)
createTemp =
  fromEither . first TestError =<< tryAny do
    systemTmp <- getTempDir
    createTempDir systemTmp "polysemy-test-"

-- |Interpret 'Test' so that fixtures are read from the directory @base@ and temp operations are performed in
-- @/tmp/polysemy-test-XXX@.
--
-- This library uses 'Path' for all file system related tasks, so in order to construct paths manually, you'll have to
-- use the quasiquoters 'Path.absdir' and 'Path.reldir' or the functions 'parseAbsDir' and 'parseRelDir'.
interpretTestKeepTemp ::
  Members [Error TestError, Embed IO] r =>
  Path Abs Dir ->
  InterpreterFor Test r
interpretTestKeepTemp base sem = do
  tempBase <- createTemp
  interpretTestIn' base tempBase sem

-- |like 'interpretTestKeepTemp', but deletes the temp dir after the test.
interpretTest ::
  Members [Error TestError, Resource, Embed IO] r =>
  Path Abs Dir ->
  InterpreterFor Test r
interpretTest base sem = do
  bracket createTemp release use
  where
    release tempBase =
      embed (ignoringIOErrors (removeDirRecur tempBase))
    use tempBase =
      interpretTestIn' base tempBase sem

-- |Call 'interpretTest' with the subdirectory @prefix@ of the current working directory as the base dir, which is
-- most likely something like @test@.
-- This is not necessarily consistent, it depends on which directory your test runner uses as cwd.
interpretTestInSubdir ::
  Members [Error TestError, Resource, Embed IO] r =>
  Text ->
  InterpreterFor Test r
interpretTestInSubdir prefix sem = do
  prefixPath <- embed (parseRelDir @IO (toString prefix))
  base <- embed (canonicalizePath @_ @IO prefixPath)
  interpretTest base sem

errorToFailure ::
  ∀ m r a .
  Monad m =>
  Member (Hedgehog m) r =>
  Either TestError a ->
  Sem r a
errorToFailure = \case
  Right a -> pure a
  Left (TestError e) -> liftH @m (failWith Nothing (toString e))

failToFailure ::
  Member (Error TestError) r =>
  InterpreterFor Fail r
failToFailure =
  failToError (TestError . toText)

-- |Run 'Hedgehog' and its dependent effects that correspond to the monad stack of 'TestT', exposing the monadic state.
unwrapLiftedTestT ::
  ∀ m r a .
  Monad m =>
  Member (Embed m) r =>
  Sem (Fail : Error TestError : Hedgehog m : r) a ->
  Sem r (Journal, Either Failure a)
unwrapLiftedTestT =
  runWriter .
  runError .
  rewriteHedgehog .
  raiseUnder2 .
  (>>= errorToFailure @m) .
  runError .
  failToFailure

-- |Run 'Hedgehog' with 'unwrapLiftedTestT' and wrap it back into the 'TestT' stack.
semToTestT ::
  Monad m =>
  Member (Embed m) r =>
  (∀ x . Sem r x -> m x) ->
  Sem (Fail : Error TestError : Hedgehog m : r) a ->
  TestT m a
semToTestT runSem sem = do
  (journal, result) <- lift (runSem (unwrapLiftedTestT sem))
  TestT (ExceptT (result <$ MTL.tell journal))

-- |'Final' version of 'semToTestT'.
semToTestTFinal ::
  Monad m =>
  Sem [Fail, Error TestError, Hedgehog m, Embed m, Final m] a ->
  TestT m a
semToTestTFinal =
  semToTestT (runFinal . embedToFinal)

type TestEffects =
  [
    Test,
    Resource,
    Fail,
    Error TestError,
    Hedgehog IO,
    Embed IO,
    Final IO
  ]

-- |Convenience combinator that runs both 'Hedgehog' and 'Test' and rewraps the result in @'TestT' IO@, ready for
-- execution as a property.
runTest ::
  Path Abs Dir ->
  Sem TestEffects a ->
  TestT IO a
runTest dir =
  semToTestTFinal .
  resourceToIOFinal .
  interpretTest dir

-- |Same as 'runTest', but uses 'interpretTestInSubdir'.
runTestInSubdir ::
  Text ->
  Sem TestEffects a ->
  TestT IO a
runTestInSubdir prefix =
  semToTestTFinal .
  resourceToIOFinal .
  interpretTestInSubdir prefix

callingTestDir ::
  Members [Error TestError, Embed IO] r =>
  HasCallStack =>
  Sem r (Path Abs Dir)
callingTestDir = do
  SrcLoc { srcLocFile = toText -> file, srcLocModule = toText -> modl } <- note emptyCallStack deepestSrcLoc
  dirPrefix <- note badSrcLoc (Text.stripSuffix (Text.replace "." "/" modl <> ".hs") file)
  cwd <- embed @IO getCurrentDir
  note badSrcLoc (parseDir cwd (toString dirPrefix))
  where
    emptyCallStack =
      TestError "empty call stack"
    deepestSrcLoc =
      snd <$> listToMaybe (reverse (getCallStack callStack))
    badSrcLoc =
      TestError "call stack couldn't be processed"
    parseDir cwd dirPrefix =
      parseAbsDir dirPrefix <|> (cwd </>) <$> parseRelDir dirPrefix

-- |Wrapper for 'semToTestT' that uses the call stack to determine the base dir of the test run.
-- Note that if you wrap this function, you'll have to use the 'HasCallStack' constraint to supply the implicit
-- 'GHC.Stack.Types.CallStack'.
runTestAutoWith ::
  HasCallStack =>
  Members [Resource, Embed IO] r =>
  (∀ x . Sem r x -> IO x) ->
  Sem (Test : Fail : Error TestError : Hedgehog IO : r) a ->
  TestT IO a
runTestAutoWith runSem sem =
  semToTestT runSem do
    base <- callingTestDir
    interpretTest base sem

-- |Version of 'runTestAutoWith' specialized to @'Final' IO@
runTestAuto ::
  HasCallStack =>
  Sem [Test, Fail, Error TestError, Hedgehog IO, Embed IO, Resource, Final IO] a ->
  TestT IO a
runTestAuto =
  runTestAutoWith (runFinal . resourceToIOFinal . embedToFinal)
