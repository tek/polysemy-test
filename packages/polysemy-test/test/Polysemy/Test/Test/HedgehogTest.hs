module Polysemy.Test.Test.HedgehogTest where

import Hedgehog (TestT, assert, (===))
import Hedgehog.Internal.Property (Failure (Failure), failWith, runTestT)
import Hedgehog.Internal.Source (spanStartLine)

import Polysemy.Test (UnitTest, runTestAuto, (/==))
import Polysemy.Test.Data.Hedgehog (Hedgehog)
import Polysemy.Test.Data.Test (Test)
import Polysemy.Test.Data.TestError (TestError (TestError))
import Polysemy.Test.Hedgehog (assertClose)
import Polysemy.Test.Run (semToTestTFinal)

test_hedgehogRewrite :: UnitTest
test_hedgehogRewrite =
  semToTestTFinal ((/==) @_ @IO (1 :: Int) 2)

hedgehogTest ::
  Sem [Test, Fail, Error TestError, Hedgehog IO, Error Failure, Embed IO, Resource, Final IO] () ->
  TestT IO Bool
hedgehogTest prog =
  extract . fst <$> liftIO (runTestT (runTestAuto prog))
  where
    extract = \case
      Left (Failure (Just _) _ _) ->
        False
      _ ->
        True

hedgehogSuccess ::
  Sem [Test, Fail, Error TestError, Hedgehog IO, Error Failure, Embed IO, Resource, Final IO] () ->
  UnitTest
hedgehogSuccess =
  assert <=< hedgehogTest

hedgehogFail ::
  Sem [Test, Fail, Error TestError, Hedgehog IO, Error Failure, Embed IO, Resource, Final IO] () ->
  UnitTest
hedgehogFail =
  assert . not <=< hedgehogTest

test_fail :: UnitTest
test_fail = do
  hedgehogFail prog
  where
    prog = do
      Right _ <- pure (Left ("failed" :: Text))
      unit

test_close :: UnitTest
test_close = do
  hedgehogSuccess (assertClose @_ @IO (1.11111 :: Double) 1.111111111111)
  hedgehogFail (assertClose @_ @IO (1.11 :: Double) 1.111111111111)

test_stack :: UnitTest
test_stack = do
  (r, _) <- liftIO $ runTestT $ runTestAuto do
    throw (TestError "error")
    pure False
  case r of
    Right _ -> failWith Nothing "not an error"
    Left (Failure Nothing _ _) -> failWith Nothing "no source span"
    Left (Failure (Just spn) _ _) -> 58 === spanStartLine spn
