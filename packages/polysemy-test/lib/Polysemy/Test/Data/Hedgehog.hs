{-# OPTIONS_HADDOCK hide #-}

module Polysemy.Test.Data.Hedgehog where

import Polysemy.Internal (send)

import Hedgehog (TestT)

-- |Convenience effect for embedding Hedgehog assertions.
data Hedgehog m :: Effect where
  LiftH :: TestT m a -> Hedgehog m n a

-- |Lift a @'TestT' IO@ into Sem.
--
-- >>> liftH (Hedgehog.evalEither (Left 0))
-- liftH (Hedgehog.evalEither (Left 0))
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- │ 0
liftH ::
  ∀ m a r .
  Member (Hedgehog m) r =>
  TestT m a ->
  Sem r a
liftH =
  send . LiftH
