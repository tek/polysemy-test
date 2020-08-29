module Main where

import Test.Tasty (TestTree, defaultMain, testGroup)

import Polysemy.Test (unitTest)
import Polysemy.Test.Test.FilesTest (test_fixture, test_tempFile)

tests :: TestTree
tests =
  testGroup "all" [
    unitTest "read fixtures" test_fixture,
    unitTest "write and read temp files" test_tempFile
  ]

main :: IO ()
main =
  defaultMain tests
