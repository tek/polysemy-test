{-# OPTIONS_HADDOCK hide #-}

module Polysemy.Test.Hedgehog where

import qualified Hedgehog as Native
import Hedgehog (TestT)

import qualified Polysemy.Test.Data.Hedgehog as Hedgehog
import Polysemy.Test.Data.Hedgehog (Hedgehog, liftH)

-- |Interpret 'Hedgehog' into @'TestT' IO@ by simple embedding of the native combinators.
interpretHedgehog ::
  Member (Embed (TestT IO)) r =>
  InterpreterFor Hedgehog r
interpretHedgehog =
  interpret \case
    Hedgehog.LiftH t ->
      embed t

-- |Embeds 'Hedgehog.assert'.
assert ::
  ∀ r .
  HasCallStack =>
  Member Hedgehog r =>
  Bool ->
  Sem r ()
assert a =
  withFrozenCallStack $ liftH (Native.assert a)

-- |Embeds 'Hedgehog.==='.
--
-- >>> 5 === 6
-- 5 === 6
-- ^^^^^^^^^^^^^^^^
-- │ ━━━ Failed (- lhs) (+ rhs) ━━━
-- │ - 5
-- │ + 6
(===) ::
  Eq a =>
  Show a =>
  HasCallStack =>
  Member Hedgehog r =>
  a ->
  a ->
  Sem r ()
a === b =
  withFrozenCallStack $ liftH (a Native.=== b)

-- |Embeds 'Hedgehog.evalEither'.
evalEither ::
  ∀ a e r .
  Show e =>
  HasCallStack =>
  Member Hedgehog r =>
  Either e a ->
  Sem r a
evalEither e =
  withFrozenCallStack $ liftH (Native.evalEither e)

-- |Given a reference value, unpacks an 'Either' with 'evalEither' and applies 'assertEqual' to the result in the
-- 'Right' case, and produces a test failure in the 'Left' case.
assertRight ::
  ∀ a e r .
  Show e =>
  Eq a =>
  Show a =>
  HasCallStack =>
  Member Hedgehog r =>
  a ->
  Either e a ->
  Sem r ()
assertRight a e =
  withFrozenCallStack $ (a ===) =<< evalEither e

data ValueIsNothing =
  ValueIsNothing
  deriving Show

assertJust ::
  Eq a =>
  Show a =>
  HasCallStack =>
  Member Hedgehog r =>
  a ->
  Maybe a ->
  Sem r ()
assertJust target ma =
  withFrozenCallStack $ assertRight target (maybeToRight ValueIsNothing ma)

evalMaybe ::
  HasCallStack =>
  Member Hedgehog r =>
  Maybe a ->
  Sem r a
evalMaybe ma =
  withFrozenCallStack $ evalEither (maybeToRight ValueIsNothing ma)
