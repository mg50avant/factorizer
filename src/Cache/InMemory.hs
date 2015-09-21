{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE FlexibleInstances #-}

module Cache.InMemory where

import qualified Data.Map as M

import Control.Applicative
import Control.Monad.State.Class

import Cache
import Types

instance Cache FactorizerM where
  cacheWrite k v = FM $ modify $ M.insert (show k) (show v)
  cacheRead k = FM $ M.lookup k <$> get
