{-# options_haddock prune #-}

-- |TestError data type, Internal
module Polysemy.Test.Data.TestError (
  TestError (TestError, UnsafeTestError),
  testError,
) where

-- | An error that occurred in the test machinery.
--
-- The pattern synonym is used for construction to ensure that the call site's stack is stored.
-- There is no 'IsString' instance because it can't propagate the call stack.
-- Use 'testError' to throw a string literal.
data TestError where
  UnsafeTestError :: HasCallStack => Text -> TestError

deriving stock instance Eq TestError
deriving stock instance Show TestError

-- | Construct a test error so that the call site's stack is stored in the value, for printing the correct location in
-- hedgehog messages.
pattern TestError :: HasCallStack => HasCallStack => Text -> TestError
pattern TestError err <- UnsafeTestError err where
  TestError err = withFrozenCallStack $ UnsafeTestError err
{-# complete TestError #-}

-- | Throw a 'TestError' with the call site's stack.
testError ::
  ∀ a r .
  HasCallStack =>
  Member (Error TestError) r =>
  Text ->
  Sem r a
testError msg =
  withFrozenCallStack $ throw (TestError msg)
