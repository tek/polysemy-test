{-# options_haddock prune #-}

-- |Hedgehog interpreters, internal
module Polysemy.Test.Hedgehog where

import Control.Monad.Trans.Except (runExceptT)
import qualified Control.Monad.Trans.Writer.Lazy as MTL
import GHC.Stack (withFrozenCallStack)
import qualified Hedgehog as Native
import Hedgehog.Internal.Property (Failure, Journal, TestT (TestT), failWith)

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
  withFrozenCallStack do
    liftH @m (Native.assert a)

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
  withFrozenCallStack do
    liftH @m (a Native.=== b)

infix 4 /==

-- |Prefix variant of '(===)'.
assertEq ::
  ∀ a m r .
  Monad m =>
  Eq a =>
  Show a =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  a ->
  Sem r ()
assertEq a b =
  withFrozenCallStack do
    liftH @m (a Native.=== b)

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
  withFrozenCallStack do
    liftH @m (a Native./== b)

-- |Prefix variant of '(/==)'.
assertNeq ::
  ∀ a m r .
  Monad m =>
  Eq a =>
  Show a =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  a ->
  Sem r ()
assertNeq a b =
  withFrozenCallStack do
    liftH @m (a Native./== b)

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
  withFrozenCallStack do
    liftH @m (Native.evalEither e)

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
assertRight a =
  withFrozenCallStack do
    assertEq @_ @m a <=< evalEither @_ @m

-- |Like 'assertRight', but for two nested Eithers.
assertRight2 ::
  ∀ a m e1 e2 r .
  Eq a =>
  Show e1 =>
  Show e2 =>
  Show a =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  Either e1 (Either e2 a) ->
  Sem r ()
assertRight2 a =
  withFrozenCallStack do
    assertRight @_ @m a <=< evalEither @_ @m

-- |Like 'assertRight', but for three nested Eithers.
assertRight3 ::
  ∀ a m e1 e2 e3 r .
  Eq a =>
  Show e1 =>
  Show e2 =>
  Show e3 =>
  Show a =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  Either e1 (Either e2 (Either e3 a)) ->
  Sem r ()
assertRight3 a =
  withFrozenCallStack do
    assertRight2 @_ @m a <=< evalEither @_ @m

-- |Like 'evalEither', but for 'Left'.
evalLeft ::
  ∀ a m e r .
  Show a =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  Either e a ->
  Sem r e
evalLeft = \case
  Right a ->
    withFrozenCallStack do
      liftH @m (failWith Nothing (show a))
  Left e ->
    pure e

-- |Like 'assertRight', but for 'Left'.
assertLeft ::
  ∀ a m e r .
  Eq e =>
  Show e =>
  Show a =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  e ->
  Either e a ->
  Sem r ()
assertLeft e =
  withFrozenCallStack do
    assertEq @_ @m e <=< evalLeft @_ @m

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
  withFrozenCallStack do
    evalEither @_ @m (maybeToRight ValueIsNothing ma)

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
  withFrozenCallStack do
    assertRight @_ @m target (maybeToRight ValueIsNothing ma)

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
  withFrozenCallStack do
    evalEither @_ @m =<< runError sem

-- |Assert that two numeric values are closer to each other than the specified @delta@.
assertCloseBy ::
  ∀ a m r .
  Num a =>
  Ord a =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  a ->
  a ->
  Sem r ()
assertCloseBy delta target scrutinee =
  withFrozenCallStack do
    assert @m (abs (scrutinee - target) < delta)

-- |Assert that two fractional values are closer to each other than @0.001@.
assertClose ::
  ∀ a m r .
  Ord a =>
  Fractional a =>
  Monad m =>
  HasCallStack =>
  Member (Hedgehog m) r =>
  a ->
  a ->
  Sem r ()
assertClose =
  withFrozenCallStack do
    assertCloseBy @_ @m 0.001
