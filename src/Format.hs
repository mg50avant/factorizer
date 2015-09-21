module Format (format) where

import Data.List

import FactorTable
import Types

format :: FactorTable -> String
format table = let result = intercalate ", " $ map formatPair (toList table)
               in "{" ++ result ++ "}"

formatPair :: (Int, [Int]) -> String
formatPair (num,nums) = show num
                          ++ ": ["
                          ++ (intercalate ", " $ map show nums)
                          ++ "]"
