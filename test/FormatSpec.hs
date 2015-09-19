module FormatSpec where

import Test.Hspec
import qualified Data.Map as M

import Format

spec :: Spec
spec = do
  describe "format" $ do
    it "formats an empty table" $ do
      format M.empty `shouldBe` "{}"

    it "formats the table for [2]" $ do
      let table = M.fromList [(2, [])]
      format table `shouldBe` "{2: []}"

    it "formats a more complex table" $ do
      let table = M.fromList [ (2, [])
                             , (3, [])
                             , (6, [2,3])]
      format table `shouldBe` "{2: [], 3: [], 6: [2, 3]}"
