module ParseSpec where

import Test.Hspec
import Parse

spec :: Spec
spec = do
  describe "parse" $ do
    it "parses an empty list" $ do
      parse "[]" `shouldBe` Just []

    it "parses a non-empty list of numbers" $ do
      parse "[1,2,3]" `shouldBe` Just [1,2,3]

    it "returns nothing if parse fails" $ do
      parse "[1,2,3" `shouldBe` Nothing
