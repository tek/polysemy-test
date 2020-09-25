{-# OPTIONS_HADDOCK hide #-}

module Polysemy.Test.Hedgehog where

import qualified Control.Monad.Trans.Writer.Lazy as MTL
import qualified Hedgehog as Native
import Hedgehog.Internal.Property (Failure, Journal, TestT(TestT))
import Polysemy.Writer (Writer, tell)

import qualified Polysemy.Test.Data.Hedgehog as Hedgehog
import Polysemy.Test.Data.Hedgehog (Hedgehog, liftH)

-- |Interpret 'Hedgehog' into @'TestT' IO@ by simple embedding of the native combinators.
interpretHedgehog ::
  Member (Embed (TestT m)) r =>
  InterpreterFor (Hedgehog m) r
interpretHedgehog =
  interpret \case
    Hedgehog.LiftH t ->
      embed t

-- |Interpret 'Hedgehog' in terms of @'Error' 'Failure'@ and @'Writer' 'Journal'@, which correspond to the monad stack
-- wrapped by 'TestT'.
rewriteHedgehog ::
  Members [Error Failure, Writer Journal, Embed m] r =>
  InterpreterFor (Hedgehog m) r
rewriteHedgehog =
  interpret \case
    Hedgehog.LiftH (TestT t) -> do
      (result, journal) <- embed (MTL.runWriterT (runExceptT t))
      tell journal
      fromEither result

-- |Embeds 'Hedgehog.assert'.
assert ::
  ∀ m r .
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  Bool ->
  Sem r ()
assert a =
  withFrozenCallStack $ liftH (Native.assert a)

infix 4 ===

-- |Embeds 'Hedgehog.==='.
--
-- >>> 5 === 6
-- 5 === 6
-- ^^^^^^^
-- │ ━━━ Failed (- lhs) (+ rhs) ━━━
-- │ - 5
-- │ + 6
(===) ::
  ∀ a m r .
  Monad m =>
  Eq a =>
  Show a =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  a ->
  Sem r ()
a === b =
  withFrozenCallStack $ liftH (a Native.=== b)

infix 4 /==

-- |Embeds 'Hedgehog./=='.
--
-- >>> 5 /== 5
-- 5 /== 5
-- ^^^^^^^
-- │ ━━━ Failed (no differences) ━━━
-- │ 5
(/==) ::
  ∀ a m r .
  Monad m =>
  Eq a =>
  Show a =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  a ->
  Sem r ()
a /== b =
  withFrozenCallStack $ liftH (a Native./== b)

-- |Embeds 'Hedgehog.evalEither'.
evalEither ::
  ∀ a m e r .
  Show e =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  Either e a ->
  Sem r a
evalEither e =
  withFrozenCallStack $ liftH (Native.evalEither e)

-- |Given a reference value, unpacks an 'Either' with 'evalEither' and applies '===' to the result in the
-- 'Right' case, and produces a test failure in the 'Left' case.
assertRight ::
  ∀ a m e r .
  Eq a =>
  Show e =>
  Show a =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  Either e a ->
  Sem r ()
assertRight a e =
  withFrozenCallStack $ (a ===) =<< evalEither e

data ValueIsNothing =
  ValueIsNothing
  deriving Show

-- |Like 'evalEither', but for 'Maybe'.
evalMaybe ::
  ∀ a m r .
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  Maybe a ->
  Sem r a
evalMaybe ma =
  withFrozenCallStack $ evalEither (maybeToRight ValueIsNothing ma)

-- |Given a reference value, asserts that the scrutinee is 'Just' and its contained value matches the target.
assertJust ::
  ∀ a m r .
  Eq a =>
  Show a =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  Maybe a ->
  Sem r ()
assertJust target ma =
  withFrozenCallStack $ assertRight target (maybeToRight ValueIsNothing ma)

-- |Run a Polysemy 'Error' effect and assert its result.
evalError ::
  ∀ e a m r .
  Show e =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  Sem (Error e : r) a ->
  Sem r a
evalError sem =
  withFrozenCallStack $ evalEither =<< runError sem
