module Polysemy.Test.Test.HedgehogTest where

import Hedgehog (assert)
import Hedgehog.Internal.Property (Failure(Failure), runTestT)

import Polysemy.Test (UnitTest, runTestAuto, (/==))
import Polysemy.Test.Run (semToTestTFinal)

test_hedgehogRewrite :: UnitTest
test_hedgehogRewrite =
  semToTestTFinal ((1 :: Int) /== 2)

test_fail :: UnitTest
test_fail = do
  (result, _) <- liftIO (runTestT $ runTestAuto $ prog)
  assert (extract result)
  where
    prog = do
      Right _ <- pure (Left ("failed" :: Text))
      unit
    extract = \case
      Left (Failure (Just _) _ _) ->
        True
      _ ->
        False
