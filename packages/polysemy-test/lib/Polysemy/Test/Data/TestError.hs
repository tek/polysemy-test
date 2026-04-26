{-# options_haddock prune #-}

-- |TestError data type, Internal
module Polysemy.Test.Data.TestError (
  TestError (TestError, SkipTest, UnsafeTestError),
  testError,
  skipTest,
  SkipTestDefaultValue (..),
) where

-- | An error that occurred in the test machinery.
--
-- The pattern synonym is used for construction to ensure that the call site's stack is stored.
-- There is no 'IsString' instance because it can't propagate the call stack.
-- Use 'testError' to throw a string literal.
--
-- The 'Bool' field indicates whether this is a skip request (@True@) or a regular error (@False@).
data TestError where
  UnsafeTestError :: HasCallStack => Bool -> Text -> TestError

deriving stock instance Eq TestError
deriving stock instance Show TestError

-- | Construct a test error so that the call site's stack is stored in the value, for printing the correct location in
-- hedgehog messages.
--
-- Match on errors that aren't skip requests.
pattern TestError :: HasCallStack => HasCallStack => Text -> TestError
pattern TestError err <- UnsafeTestError False err where
  TestError err = withFrozenCallStack $ UnsafeTestError False err

-- | Match on skip requests.
pattern SkipTest :: HasCallStack => HasCallStack => Text -> TestError
pattern SkipTest err <- UnsafeTestError True err

{-# complete TestError, SkipTest #-}

-- | Throw a 'TestError' with the call site's stack.
testError ::
  ∀ a r .
  HasCallStack =>
  Member (Error TestError) r =>
  Text ->
  Sem r a
testError msg =
  withFrozenCallStack $ throw (TestError msg)

-- | Skip the current test with a reason message.
--
-- This is intended for tests that require specific environmental conditions (e.g. programs in @$PATH@) that cannot be
-- checked at the test entry point.
-- The test will only be skipped if a fallback value is available, either via 'SkipTestDefaultValue' or an explicit
-- override.
skipTest ::
  ∀ a r .
  HasCallStack =>
  Member (Error TestError) r =>
  Text ->
  Sem r a
skipTest msg =
  withFrozenCallStack $ throw (UnsafeTestError True msg)

-- | Provides a default fallback value for skipped tests.
--
-- When a test calls 'skipTest', the runner can recover with the fallback value instead of failing.
-- The base instance returns 'Nothing', meaning skipped tests will fail.
-- The @()@ instance returns @'Just' ()@, allowing @'TestT' IO ()@ tests to be skipped silently.
class SkipTestDefaultValue a where
  skipTestDefaultValue :: Maybe a
  skipTestDefaultValue = Nothing

instance {-# overlappable #-} SkipTestDefaultValue a where

instance SkipTestDefaultValue () where
  skipTestDefaultValue = Just ()
