module Polysemy.Test.Test.HedgehogTest where

import Polysemy.Test (UnitTest, (/==))
import Polysemy.Test.Run (semToTestTFinal)

test_hedgehogRewrite :: UnitTest
test_hedgehogRewrite =
  semToTestTFinal ((1 :: Int) /== 2)
