{-# OPTIONS_HADDOCK hide #-}

module Polysemy.Test.Data.TestError where

newtype TestError =
  TestError { unTestError :: Text }
  deriving (Eq, Show)
  deriving newtype (IsString)
