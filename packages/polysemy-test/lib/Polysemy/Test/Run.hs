{-# options_haddock prune #-}

-- |Test Interpreters, Internal
module Polysemy.Test.Run where

import qualified Control.Exception as Base
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Except (ExceptT (..))
import qualified Control.Monad.Trans.Writer.Lazy as MTL
import qualified Data.Text as Text
import GHC.Stack (callStack)
import GHC.Stack.Types (SrcLoc (SrcLoc, srcLocFile), getCallStack, srcLocModule)
import Hedgehog.Internal.Property (Failure, Journal, TestT (..), failWith)
import Path (Abs, Dir, Path, parseAbsDir, parseRelDir, (</>))
import Path.IO (canonicalizePath, createTempDir, getCurrentDir, getTempDir, removeDirRecur)
import System.IO.Error (IOError)

import Polysemy.Test.Data.Hedgehog (Hedgehog, liftH)
import qualified Polysemy.Test.Data.Test as Test
import Polysemy.Test.Data.Test (Test)
import Polysemy.Test.Data.TestError (SkipTestDefaultValue (..), TestError (..))
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
  Maybe a ->
  Either TestError a ->
  Sem r a
errorToFailure fallback = \case
  Right a -> pure a
  Left (SkipTest msg)
    | Just fb <- fallback
    -> pure fb
    | otherwise
    -> liftH @m (failWith Nothing (cannotSkip <> toString msg))
  Left (TestError msg) ->
    liftH @m (failWith Nothing (toString msg))
  where
    cannotSkip = "Test requested to be skipped, but no default result was provided. Original message: "

failToFailure ::
  Member (Error TestError) r =>
  InterpreterFor Fail r
failToFailure =
  failToError (TestError . toText)

-- |Like 'unwrapLiftedTestT', but with an explicit fallback value override for 'SkipTest'.
unwrapLiftedTestTSkippable ::
  ∀ m r a .
  Monad m =>
  SkipTestDefaultValue a =>
  Member (Embed m) r =>
  Maybe a ->
  Sem (Fail : Error TestError : Hedgehog m : Error Failure : r) a ->
  Sem r (Journal, Either Failure a)
unwrapLiftedTestTSkippable override =
  runWriter .
  runError .
  rewriteHedgehog .
  raise2Under .
  (>>= errorToFailure @m fallback) .
  runError .
  failToFailure
  where
    fallback = override <|> skipTestDefaultValue

-- |Run 'Hedgehog' and its dependent effects that correspond to the monad stack of 'TestT', exposing the monadic state.
unwrapLiftedTestT ::
  ∀ m r a .
  Monad m =>
  SkipTestDefaultValue a =>
  Member (Embed m) r =>
  Sem (Fail : Error TestError : Hedgehog m : Error Failure : r) a ->
  Sem r (Journal, Either Failure a)
unwrapLiftedTestT =
  unwrapLiftedTestTSkippable Nothing

-- |Run 'Hedgehog' with 'unwrapLiftedTestT' and wrap it back into the 'TestT' stack.
semToTestT ::
  Monad m =>
  SkipTestDefaultValue a =>
  Member (Embed m) r =>
  (∀ x . Sem r x -> m x) ->
  Sem (Fail : Error TestError : Hedgehog m : Error Failure : r) a ->
  TestT m a
semToTestT =
  semToTestTSkippable Nothing

-- |Like 'semToTestT', but with an explicit fallback value override for 'SkipTest'.
semToTestTSkippable ::
  Monad m =>
  SkipTestDefaultValue a =>
  Member (Embed m) r =>
  Maybe a ->
  (∀ x . Sem r x -> m x) ->
  Sem (Fail : Error TestError : Hedgehog m : Error Failure : r) a ->
  TestT m a
semToTestTSkippable override runSem sem = do
  (journal, result) <- lift (runSem (unwrapLiftedTestTSkippable override sem))
  TestT (ExceptT (result <$ MTL.tell journal))

-- |'Final' version of 'semToTestT'.
semToTestTFinal ::
  Monad m =>
  SkipTestDefaultValue a =>
  Sem [Fail, Error TestError, Hedgehog m, Error Failure, Embed m, Final m] a ->
  TestT m a
semToTestTFinal =
  semToTestT (runFinal . embedToFinal)

-- |Like 'semToTestTFinal', but with an explicit fallback value override for 'SkipTest'.
semToTestTFinalSkippable ::
  Monad m =>
  SkipTestDefaultValue a =>
  Maybe a ->
  Sem [Fail, Error TestError, Hedgehog m, Error Failure, Embed m, Final m] a ->
  TestT m a
semToTestTFinalSkippable override =
  semToTestTSkippable override (runFinal . embedToFinal)

type TestEffects =
  [
    Test,
    Resource,
    Fail,
    Error TestError,
    Hedgehog IO,
    Error Failure,
    Embed IO,
    Final IO
  ]

-- |Convenience combinator that runs both 'Hedgehog' and 'Test' and rewraps the result in @'TestT' IO@, ready for
-- execution as a property.
runTest ::
  SkipTestDefaultValue a =>
  Path Abs Dir ->
  Sem TestEffects a ->
  TestT IO a
runTest =
  runTestSkippable Nothing

-- |Like 'runTest', but with an explicit fallback value override for 'SkipTest'.
runTestSkippable ::
  SkipTestDefaultValue a =>
  Maybe a ->
  Path Abs Dir ->
  Sem TestEffects a ->
  TestT IO a
runTestSkippable override dir =
  semToTestTFinalSkippable override .
  resourceToIOFinal .
  interpretTest dir

-- |Like 'runTestInSubdir', but with an explicit fallback value override for 'SkipTest'.
runTestInSubdirSkippable ::
  SkipTestDefaultValue a =>
  Maybe a ->
  Text ->
  Sem TestEffects a ->
  TestT IO a
runTestInSubdirSkippable override prefix =
  semToTestTFinalSkippable override .
  resourceToIOFinal .
  interpretTestInSubdir prefix

-- |Same as 'runTest', but uses 'interpretTestInSubdir'.
runTestInSubdir ::
  SkipTestDefaultValue a =>
  Text ->
  Sem TestEffects a ->
  TestT IO a
runTestInSubdir =
  runTestInSubdirSkippable Nothing

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

-- |Like 'runTestAutoWith', but with an explicit fallback value override for 'SkipTest'.
runTestAutoWithSkippable ::
  HasCallStack =>
  SkipTestDefaultValue a =>
  Members [Resource, Embed IO] r =>
  Maybe a ->
  (∀ x . Sem r x -> IO x) ->
  Sem (Test : Fail : Error TestError : Hedgehog IO : Error Failure : r) a ->
  TestT IO a
runTestAutoWithSkippable override runSem sem =
  semToTestTSkippable override runSem do
    base <- callingTestDir
    interpretTest base sem

-- |Wrapper for 'semToTestT' that uses the call stack to determine the base dir of the test run.
-- Note that if you wrap this function, you'll have to use the 'HasCallStack' constraint to supply the implicit
-- 'GHC.Stack.Types.CallStack'.
runTestAutoWith ::
  HasCallStack =>
  SkipTestDefaultValue a =>
  Members [Resource, Embed IO] r =>
  (∀ x . Sem r x -> IO x) ->
  Sem (Test : Fail : Error TestError : Hedgehog IO : Error Failure : r) a ->
  TestT IO a
runTestAutoWith =
  runTestAutoWithSkippable Nothing

-- |Like 'runTestAuto', but with an explicit fallback value override for 'SkipTest'.
runTestAutoSkippable ::
  HasCallStack =>
  SkipTestDefaultValue a =>
  Maybe a ->
  Sem [Test, Fail, Error TestError, Hedgehog IO, Error Failure, Embed IO, Resource, Final IO] a ->
  TestT IO a
runTestAutoSkippable override =
  runTestAutoWithSkippable override (runFinal . resourceToIOFinal . embedToFinal)

-- |Version of 'runTestAutoWith' specialized to @'Final' IO@
runTestAuto ::
  HasCallStack =>
  SkipTestDefaultValue a =>
  Sem [Test, Fail, Error TestError, Hedgehog IO, Error Failure, Embed IO, Resource, Final IO] a ->
  TestT IO a
runTestAuto =
  runTestAutoSkippable Nothing
