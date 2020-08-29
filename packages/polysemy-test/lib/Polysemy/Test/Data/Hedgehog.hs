{-# OPTIONS_HADDOCK hide #-}

module Polysemy.Test.Data.Hedgehog where

import Polysemy.Internal (send)

import Hedgehog (TestT)

-- |Convenience effect for embedding Hedgehog assertions.
data Hedgehog :: Effect where
  LiftH :: TestT IO a -> Hedgehog m a

-- |Lift a @'TestT' IO@ into Sem.
--
-- >>> liftH (Hedgehog.evalEither (Left 0))
-- liftH (Hedgehog.evalEither (Left 0))
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
-- │ 0
liftH ::
  ∀ a r .
  Member Hedgehog r =>
  TestT IO a ->
  Sem r a
liftH =
  send . LiftH
