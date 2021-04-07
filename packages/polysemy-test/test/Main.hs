module Main where

import Polysemy.Test (unitTest)
import Polysemy.Test.Test.FilesTest (test_fixture, test_tempFile)
import Polysemy.Test.Test.HedgehogTest (test_close, test_fail, test_hedgehogRewrite)
import Test.Tasty (TestTree, defaultMain, testGroup)

tests :: TestTree
tests =
  testGroup "all" [
    unitTest "read fixtures" test_fixture,
    unitTest "write and read temp files" test_tempFile,
    unitTest "rewrite TestT to Sem" test_hedgehogRewrite,
    unitTest "convert MonadFail to assertion" test_fail,
    unitTest "assert that two Doubles are close" test_close
  ]

main :: IO ()
main =
  defaultMain tests
