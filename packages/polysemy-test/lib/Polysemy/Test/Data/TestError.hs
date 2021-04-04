{-# options_haddock hide #-}

module Polysemy.Test.Data.TestError where

-- |An error that occured in the test machinery.
newtype TestError =
  TestError { unTestError :: Text }
  deriving (Eq, Show)
  deriving newtype (IsString)
