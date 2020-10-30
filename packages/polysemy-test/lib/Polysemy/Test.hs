{-|
This package provides utilities for testing Polysemy programs:

  (1) An effect, 'Test', that gives access to temporary files and fixtures
  (2) An effect, 'Hedgehog', for lifted Hedgehog assertions
-}
module Polysemy.Test (
  -- $intro
  -- * Test effect
  module Polysemy.Test.Data.Test,
  tempFileLines,
  fixtureLines,
  interpretTestKeepTemp,
  interpretTest,
  interpretTestInSubdir,
  -- * Hedgehog effect
  module Polysemy.Test.Data.Hedgehog,
  assert,
  (===),
  (/==),
  assertRight,
  assertRight2,
  assertRight3,
  assertJust,
  evalEither,
  evalMaybe,
  evalError,
  assertCloseBy,
  assertClose,
  interpretHedgehog,
  -- * Running 'Hedgehog' and 'Test' as 'TestT'
  runTestAutoWith,
  runTestAuto,
  runTest,
  runTestInSubdir,
  unwrapLiftedTestT,
  semToTestT,
  semToTestTFinal,
  -- * Utilities
  UnitTest,
  unitTest,
  TestError(TestError),
) where

import qualified Data.Text as Text
import Hedgehog (TestT, property, test, withTests)
import Path (File, Path, Rel)
import Test.Tasty (TestName, TestTree)
import Test.Tasty.Hedgehog (testProperty)

import Polysemy.Test.Data.Hedgehog (Hedgehog, liftH)
import Polysemy.Test.Data.Test (Test, fixture, fixturePath, tempDir, tempFile, tempFileContent, testDir)
import Polysemy.Test.Data.TestError (TestError(TestError))
import Polysemy.Test.Hedgehog (
  assert,
  assertClose,
  assertCloseBy,
  assertJust,
  assertRight,
  assertRight2,
  assertRight3,
  evalEither,
  evalError,
  evalMaybe,
  interpretHedgehog,
  (/==),
  (===),
  )
import Polysemy.Test.Run (
  interpretTest,
  interpretTestInSubdir,
  interpretTestKeepTemp,
  runTest,
  runTestAuto,
  runTestAutoWith,
  runTestInSubdir,
  semToTestT,
  semToTestTFinal,
  unwrapLiftedTestT,
  )

-- |Convenience type alias for tests.
type UnitTest = TestT IO ()

-- |Convert a @'TestT' IO ()@ to a 'TestTree' ready for use with Tasty's machinery.
-- This is for non-property tests.
unitTest ::
  TestName ->
  UnitTest ->
  TestTree
unitTest desc =
  testProperty desc . withTests 1 . property . test

-- |Read the contents of a file relative to the fixture directory as a list of lines.
fixtureLines ::
  ∀ r .
  Member Test r =>
  Path Rel File ->
  Sem r [Text]
fixtureLines =
  fmap Text.lines . fixture

-- |Read the contents of a temporary file as a list of lines.
tempFileLines ::
  ∀ r .
  Member Test r =>
  Path Rel File ->
  Sem r [Text]
tempFileLines =
  fmap Text.lines . tempFileContent

{- $intro
@
import Path (relfile)
import Polysemy.Test
import Test.Tasty (defaultMain)

test_fixture :: UnitTest
test_fixture =
  runTestAuto do
    fixContent1 <- fixtureLines fixRel
    fixPath <- Test.fixturePath fixRel
    fixContent2 \<- Text.lines \<$> embed (Text.readFile (toFilePath fixPath))
    fixContent1 === fixContent2
    fixContent1 === ["file", "content"]
  where
    fixRel =
      [relfile|files/file1|]

main :: IO ()
main =
  defaultMain (unitTest test_fixture)
@
-}
