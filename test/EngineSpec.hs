{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module EngineSpec where

import Control.Applicative
import Control.Monad
import Control.Monad.State
import qualified Data.Map as M
import Test.Hspec
import Cache
import Engine
import qualified FactorTable as FT

spec :: Spec
spec = do
  describe "getFactorTable" $ do
    it "returns the correct factor table" $ do
      let MockCache computation = getFactorTable [1, 2]
          result = evalState computation emptyCacheData
      result `shouldBe` FT.computeForList [1, 2]

    it "writes to the cache for new lookups" $ do
      let MockCache computation = getFactorTable [1, 2]
          result = execState computation emptyCacheData
      numWrites result `shouldBe` 1

    it "writes to the cache only when asked for new lookups" $ do
      let MockCache computation = do getFactorTable [1, 2]
                                     getFactorTable [1, 2, 3, 4]
                                     getFactorTable [1, 2]
          result = execState computation emptyCacheData
      numWrites result `shouldBe` 2

data MockCacheData = MockCacheData { numWrites :: Int
                                   , cache :: M.Map String String
                                   }

newtype MockCache a = MockCache (State MockCacheData a)
                    deriving (Applicative, Functor, Monad)

emptyCacheData = MockCacheData 0 M.empty

instance Cache MockCache where
  cacheWrite k v = MockCache $ modify $ \cacheData ->
    cacheData{ numWrites = (numWrites cacheData + 1)
             , cache = M.insert (show k) (show v) (cache cacheData)
             }

  cacheRead k = MockCache $ do cacheData <- get
                               return $ M.lookup k (cache cacheData)
