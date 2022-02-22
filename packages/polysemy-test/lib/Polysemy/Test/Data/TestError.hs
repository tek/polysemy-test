{-# options_haddock prune #-}

-- |TestError Newtype, Internal
module Polysemy.Test.Data.TestError where

-- |An error that occured in the test machinery.
newtype TestError =
  TestError { unTestError :: Text }
  deriving (Eq, Show)
  deriving newtype (IsString)
