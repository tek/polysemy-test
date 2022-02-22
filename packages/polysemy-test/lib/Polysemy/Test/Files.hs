{-# options_haddock prune #-}

-- |File Utilities, Internal
module Polysemy.Test.Files where

import qualified Data.Text as Text
import qualified Data.Text.IO as Text
import Path (Abs, Dir, File, Path, Rel, parent, reldir, toFilePath, (</>))
import Path.IO (createDirIfMissing)

tempPath ::
  Path Abs Dir ->
  Path Rel b ->
  Path Abs b
tempPath base path =
  base </> [reldir|temp|] </> path

tempDir ::
  Member (Embed IO) r =>
  Path Abs Dir ->
  Path Rel Dir ->
  Sem r (Path Abs Dir)
tempDir base path = do
  embed (createDirIfMissing @IO True fullPath)
  pure fullPath
  where
    fullPath =
      tempPath base path

readFile ::
  Member (Embed IO) r =>
  Path Abs File ->
  Sem r Text
readFile path =
  embed (Text.readFile (toFilePath path))

tempFile ::
  Member (Embed IO) r =>
  Path Abs Dir ->
  [Text] ->
  Path Rel File ->
  Sem r (Path Abs File)
tempFile base content path = do
  void (tempDir base (parent path))
  fullPath <$ embed (Text.writeFile (toFilePath fullPath) (Text.intercalate "\n" content))
  where
    fullPath =
      tempPath base path

tempFileContent ::
  Member (Embed IO) r =>
  Path Abs Dir ->
  Path Rel File ->
  Sem r Text
tempFileContent base path =
  readFile (tempPath base path)

fixturePath ::
  Path Abs Dir ->
  Path Rel p ->
  Sem r (Path Abs p)
fixturePath base path = do
  pure (base </> [reldir|fixtures|] </> path)

fixture ::
  Member (Embed IO) r =>
  Path Abs Dir ->
  Path Rel File ->
  Sem r Text
fixture base subPath =
  readFile =<< fixturePath base subPath
