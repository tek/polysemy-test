{-# OPTIONS_HADDOCK hide #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Polysemy.Test.Prelude (
  module Polysemy.Test.Prelude,
  module Data.Either.Combinators,
  module Data.Foldable,
  module Data.Map.Strict,
  module Debug.Trace,
  module GHC.Err,
  module Polysemy,
  module Polysemy.AtomicState,
  module Polysemy.Error,
  module Polysemy.Internal.Bundle,
  module Polysemy.Reader,
  module Polysemy.State,
  module Relude,
) where

import Control.Exception (throwIO, try)
import Data.Either.Combinators (mapLeft)
import Data.Foldable (foldl, traverse_)
import Data.Map.Strict (Map, lookup)
import Data.String.Interpolate (i)
import qualified Data.Text as Text
import Debug.Trace (trace, traceShow)
import GHC.Err (undefined)
import GHC.IO.Unsafe (unsafePerformIO)
import Language.Haskell.TH.Quote (QuasiQuoter)
import Polysemy (
  Effect,
  EffectRow,
  Embed,
  Final,
  InterpreterFor,
  Member,
  Members,
  Sem,
  WithTactics,
  embed,
  embedToFinal,
  interpret,
  makeSem,
  pureT,
  raise,
  raiseUnder,
  raiseUnder2,
  raiseUnder3,
  reinterpret,
  runFinal,
  )
import Polysemy.AtomicState (AtomicState, atomicGet, atomicGets, atomicModify', atomicPut, runAtomicStateTVar)
import Polysemy.Error (Error, fromEither, mapError, note, runError, throw)
import Polysemy.Internal.Bundle (Append)
import Polysemy.Reader (Reader)
import Polysemy.State (State, evalState, get, gets, modify, modify', put, runState)
import Relude hiding (
  Reader,
  State,
  Type,
  ask,
  asks,
  evalState,
  filterM,
  get,
  gets,
  hoistEither,
  modify,
  modify',
  put,
  readFile,
  runReader,
  runState,
  state,
  trace,
  traceShow,
  undefined,
  )
import System.IO.Error (userError)

dbg :: Monad m => Text -> m ()
dbg msg = do
  () <- return $ unsafePerformIO (putStrLn (toString msg))
  return ()
{-# INLINE dbg #-}

dbgs :: Monad m => Show a => a -> m ()
dbgs a =
  dbg (show a)
{-# INLINE dbgs_ #-}

dbgs_ :: Monad m => Show a => a -> m a
dbgs_ a =
  a <$ dbg (show a)
{-# INLINE dbgs #-}

unit ::
  Applicative f =>
  f ()
unit =
  pure ()
{-# INLINE unit #-}

tuple ::
  Applicative f =>
  f a ->
  f b ->
  f (a, b)
tuple fa fb =
  (,) <$> fa <*> fb
{-# INLINE tuple #-}

unsafeLogSAnd :: Show a => a -> b -> b
unsafeLogSAnd a b =
  unsafePerformIO $ print a >> return b
{-# INLINE unsafeLogSAnd #-}

unsafeLogAnd :: Text -> b -> b
unsafeLogAnd a b =
  unsafePerformIO $ putStrLn (toString a) >> return b
{-# INLINE unsafeLogAnd #-}

unsafeLogS :: Show a => a -> a
unsafeLogS a =
  unsafePerformIO $ print a >> return a
{-# INLINE unsafeLogS #-}

liftT ::
  forall m f r e a .
  Functor f =>
  Sem r a ->
  Sem (WithTactics e f m r) (f a)
liftT =
  pureT <=< raise
{-# INLINE liftT #-}

hoistEither ::
  Member (Error e2) r =>
  (e1 -> e2) ->
  Either e1 a ->
  Sem r a
hoistEither f =
  fromEither . mapLeft f
{-# INLINE hoistEither #-}

hoistEitherWith ::
  (e -> Sem r a) ->
  Either e a ->
  Sem r a
hoistEitherWith f =
  either f pure
{-# INLINE hoistEitherWith #-}

hoistEitherShow ::
  Show e1 =>
  Member (Error e2) r =>
  (Text -> e2) ->
  Either e1 a ->
  Sem r a
hoistEitherShow f =
  fromEither . mapLeft (f . Text.replace "\\" "" . show)
{-# INLINE hoistEitherShow #-}

hoistErrorWith ::
  (e -> Sem r a) ->
  Sem (Error e : r) a ->
  Sem r a
hoistErrorWith f =
  hoistEitherWith f <=< runError
{-# INLINE hoistErrorWith #-}

tryAny ::
  Member (Embed IO) r =>
  IO a ->
  Sem r (Either Text a)
tryAny =
  embed . fmap (mapLeft show) . try @SomeException
{-# INLINE tryAny #-}

tryHoist ::
  Member (Embed IO) r =>
  (Text -> e) ->
  IO a ->
  Sem r (Either e a)
tryHoist f =
  fmap (mapLeft f) . tryAny
{-# INLINE tryHoist #-}

tryThrow ::
  Members [Embed IO, Error e] r =>
  (Text -> e) ->
  IO a ->
  Sem r a
tryThrow f =
  fromEither <=< tryHoist f
{-# INLINE tryThrow #-}

throwTextIO :: Text -> IO a
throwTextIO =
  throwIO . userError . toString
{-# INLINE throwTextIO #-}

throwEitherIO :: Either Text a -> IO a
throwEitherIO =
  traverseLeft throwTextIO
{-# INLINE throwEitherIO #-}

type a ++ b =
  Append a b

rightOr :: (a -> b) -> Either a b -> b
rightOr f =
  either f id
{-# INLINE rightOr #-}

traverseLeft ::
  Applicative m =>
  (a -> m b) ->
  Either a b ->
  m b
traverseLeft f =
  either f pure
{-# INLINE traverseLeft #-}

as ::
  Functor m =>
  a ->
  m b ->
  m a
as =
  (<$)
{-# INLINE as #-}

mneToList :: Maybe (NonEmpty a) -> [a]
mneToList =
  maybe [] toList
{-# INLINE mneToList #-}

qt :: QuasiQuoter
qt =
  i
{-# INLINE qt #-}
