{-# OPTIONS_HADDOCK hide #-}

module Polysemy.Test.Run where

import Control.Exception (catch)
import qualified Control.Monad.Trans.Writer.Lazy as MTL
import qualified Data.Text as Text
import GHC.Stack.Types (SrcLoc(SrcLoc, srcLocModule, srcLocFile))
import Hedgehog.Internal.Property (Failure, Journal, TestT(TestT), failWith)
import Path (Abs, Dir, Path, parseAbsDir, parseRelDir, reldir, (</>))
import Path.IO (canonicalizePath, getCurrentDir, removeDirRecur)
import Polysemy.Writer (runLazyWriter)
import System.IO.Error (IOError)

import Polysemy.Test.Data.Hedgehog (Hedgehog, liftH)
import qualified Polysemy.Test.Data.Test as Test
import Polysemy.Test.Data.Test (Test)
import Polysemy.Test.Data.TestError (TestError(TestError))
import qualified Polysemy.Test.Files as Files
import Polysemy.Test.Hedgehog (rewriteHedgehog)

ignoringIOErrors ::
  IO () ->
  IO ()
ignoringIOErrors ioe =
  catch ioe handler
  where
    handler :: Monad m => IOError -> m ()
    handler =
      const unit

interpretTestIn' ::
  Member (Embed IO) r =>
  Path Abs Dir ->
  InterpreterFor Test r
interpretTestIn' base =
  interpret \case
    Test.TestDir ->
      pure base
    Test.TempDir path ->
      Files.tempDir base path
    Test.TempFile content path ->
      Files.tempFile base content path
    Test.TempFileContent path ->
      Files.tempFileContent base path
    Test.FixturePath path ->
      Files.fixturePath base path
    Test.Fixture path ->
      Files.fixture base path

-- |Interpret 'Test' so that all file system operations are performed in the directory @base@.
-- The @temp@ directory will be removed before running.
--
-- This library uses 'Path' for all file system related tasks, so in order to construct paths manually, you'll have to
-- use the quasiquoters 'Path.absdir' and 'reldir' or the functions 'parseAbsDir' and 'parseRelDir'.
interpretTest ::
  Member (Embed IO) r =>
  Path Abs Dir ->
  InterpreterFor Test r
interpretTest base sem = do
  let tempDir' = base </> [reldir|temp|]
  embed (ignoringIOErrors (removeDirRecur tempDir'))
  (interpretTestIn' base) sem

-- |Call 'interpretTest' with the subdirectory @prefix@ of the current working directory as the base dir, which is
-- most likely something like @test@.
-- This is not necessarily consistent, it depends on which directory your test runner uses as cwd.
interpretTestInSubdir ::
  Member (Embed IO) r =>
  Text ->
  InterpreterFor Test r
interpretTestInSubdir prefix sem = do
  prefixPath <- embed (parseRelDir @IO (toString prefix))
  base <- embed (canonicalizePath @_ @IO prefixPath)
  (interpretTest base) sem

type TestEffects =
  [
    Error TestError,
    Hedgehog IO,
    Embed IO,
    Final IO
  ]

errorToFailure ::
  Monad m =>
  Member (Hedgehog m) r =>
  Either TestError a ->
  Sem r a
errorToFailure = \case
  Right a -> pure a
  Left (TestError e) -> liftH (failWith Nothing (toString e))

-- |Run 'Hedgehog' and its dependent effects that correspond to the monad stack of 'TestT', exposing the monadic state.
unwrapLiftedTestT ::
  Monad m =>
  Member (Embed m) r =>
  Sem (Error TestError : Hedgehog m : r) a ->
  Sem r (Journal, Either Failure a)
unwrapLiftedTestT =
  runLazyWriter .
  runError .
  rewriteHedgehog .
  raiseUnder2 .
  (>>= errorToFailure) .
  runError

-- |Run 'Hedgehog' with 'unwrapLiftedTestT' and wrap it back into the 'TestT' stack.
semToTestT ::
  Monad m =>
  Member (Embed m) r =>
  (∀ x . Sem r x -> m x) ->
  Sem (Error TestError : Hedgehog m : r) a ->
  TestT m a
semToTestT run sem = do
  (journal, result) <- lift (run (unwrapLiftedTestT sem))
  TestT (ExceptT (result <$ MTL.tell journal))

semToTestTFinal ::
  Monad m =>
  Sem [Error TestError, Hedgehog m, Embed m, Final m] a ->
  TestT m a
semToTestTFinal =
  semToTestT (runFinal . embedToFinal)

-- |Convenience combinator that runs both 'Hedgehog' and 'Test' and rewraps the result in @'TestT' IO@, ready for
-- execution as a property.
runTest ::
  Path Abs Dir ->
  Sem (Test : TestEffects) a ->
  TestT IO a
runTest dir =
  semToTestTFinal .
  interpretTest dir

-- |Same as 'runTest', but uses 'interpretTestInSubdir'.
runTestInSubdir ::
  Text ->
  Sem (Test : TestEffects) a ->
  TestT IO a
runTestInSubdir prefix =
  semToTestTFinal .
  interpretTestInSubdir prefix

callingTestDir ::
  Members [Error TestError, Embed IO] r =>
  HasCallStack =>
  Sem r (Path Abs Dir)
callingTestDir = do
  SrcLoc { srcLocFile = toText -> file, srcLocModule = toText -> modl } <- note emptyCallStack deepestSrcLoc
  dirPrefix <- note badSrcLoc (Text.stripSuffix (Text.replace "." "/" modl <> ".hs") file)
  cwd <- embed getCurrentDir
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
  Member (Embed IO) r =>
  (∀ x . Sem r x -> IO x) ->
  Sem (Test : Error TestError : Hedgehog IO : r) a ->
  TestT IO a
runTestAutoWith run sem =
  semToTestT run do
    base <- callingTestDir
    interpretTest base sem

-- |Version of 'runTestAutoWith' specialized to @'Final' IO@
runTestAuto ::
  HasCallStack =>
  Sem (Test : TestEffects) a ->
  TestT IO a
runTestAuto =
  runTestAutoWith (runFinal . embedToFinal)
