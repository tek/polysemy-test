{-# OPTIONS_HADDOCK hide #-}

module Polysemy.Test.Data.Test where

import Path (Abs, Dir, File, Path, Rel)
import Polysemy (makeSem_)

-- |Operations for interacting with fixtures and temp files in a test.
data Test :: Effect where
  TestDir :: Test m (Path Abs Dir)
  TempDir :: Path Rel Dir -> Test m (Path Abs Dir)
  TempFile :: [Text] -> Path Rel File -> Test m (Path Abs File)
  TempFileContent :: Path Rel File -> Test m Text
  FixturePath :: Path Rel p -> Test m (Path Abs p)
  Fixture :: Path Rel File -> Test m Text

makeSem_ ''Test

-- |Return the base dir in which tests are executed.
testDir ::
  ∀ r .
  Member Test r =>
  Sem r (Path Abs Dir)

-- |Create a subdirectory of the directory for temporary files and return its absolute path.
tempDir ::
  ∀ r .
  Member Test r =>
  Path Rel Dir ->
  Sem r (Path Abs Dir)

-- |Write the specified lines of 'Text' to a file under the temp dir and return its absolute path.
tempFile ::
  ∀ r .
  Member Test r =>
  [Text] ->
  Path Rel File ->
  Sem r (Path Abs File)

-- |Read the contents of a temporary file.
tempFileContent ::
  ∀ r .
  Member Test r =>
  Path Rel File ->
  Sem r Text

-- |Construct a path relative to the fixture directory.
fixturePath ::
  ∀ p r .
  Member Test r =>
  Path Rel p ->
  Sem r (Path Abs p)

-- |Read the contents of a file relative to the fixture directory.
fixture ::
  ∀ r .
  Member Test r =>
  Path Rel File ->
  Sem r Text
