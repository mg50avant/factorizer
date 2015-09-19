{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE FlexibleInstances #-}

module Cache.InMemory where

import qualified Data.Map as M

import Control.Applicative
import Control.Monad.State.Class

import Cache

instance (Functor m, MonadState (M.Map String String) m) => Cache m where
  cacheWrite k v = modify $ M.insert (show k) (show v)
  cacheRead k = M.lookup k <$> get
