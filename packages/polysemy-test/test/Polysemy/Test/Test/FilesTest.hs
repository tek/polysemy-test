module Polysemy.Test.Test.FilesTest where

import qualified Data.Text as Text
import qualified Data.Text.IO as Text
import Path (relfile, toFilePath)

import Polysemy.Test (UnitTest, fixtureLines, runTestAuto, runTestInSubdir, tempFileLines, (/==), (===))
import qualified Polysemy.Test.Data.Test as Test

test_fixture :: UnitTest
test_fixture =
  runTestAuto do
    fixContent1 <- fixtureLines fixRel
    fixPath <- Test.fixturePath fixRel
    fixContent2 <- Text.lines <$> embed (Text.readFile (toFilePath fixPath))
    (===) @_ @IO fixContent1 fixContent2
    (===) @_ @IO fixContent1 ["file", "content"]
    (/==) @_ @IO fixContent1 ["file", "content", "and more"]
  where
    fixRel =
      [relfile|files/file1|]

test_tempFile :: UnitTest
test_tempFile =
  runTestInSubdir "test" do
    tempFile <- Test.tempFile content path
    tempFileContent1 <- tempFileLines path
    tempFIleContent2 <- Text.lines <$> embed (Text.readFile (toFilePath tempFile))
    (===) @_ @IO tempFileContent1 tempFIleContent2
    (===) @_ @IO tempFileContent1 content
  where
    path =
      [relfile|tempfile/file1|]
    content =
      ["line1", "line2"]
