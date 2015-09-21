module FactorTableSpec where

import Test.Hspec
import qualified Data.Map as M

import FactorTable

spec :: Spec
spec = do
  describe "computeForList" $ do
    it "finds the factor table of an empty list" $ do
      computeForList [] `shouldBe` M.empty

    it "finds the factor table of [3]" $ do
      computeForList [3] `shouldBe` M.fromList [(3, [])]

    it "finds the factor table of [2, 4]" $ do
      computeForList [2, 4] `shouldBe` M.fromList [(2, []), (4, [2])]

    it "finds the factor table of [2, 4, 5, 10, 20]" $ do
      computeForList [2, 4, 5, 10, 20] `shouldBe` M.fromList [ (2, [])
                                                       , (4, [2])
                                                       , (5, [])
                                                       , (10, [2, 5])
                                                       , (20, [2, 4, 5, 10])]
    it "is insensitive to ordering" $ do
      computeForList [20, 10, 5, 4, 2] `shouldBe` M.fromList [ (2, [])
                                                       , (4, [2])
                                                       , (5, [])
                                                       , (10, [2, 5])
                                                       , (20, [2, 4, 5, 10])]

    it "blows up on zeroes" $ do
      (computeForList [2, 0, 4] `seq` return ()) `shouldThrow` anyException
