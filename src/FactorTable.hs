module FactorTable (computeForList, toList) where

import qualified Data.Map as M
import qualified Data.List as L
import qualified Data.Set as S

import Types

toList :: FactorTable -> [(Int, [Int])]
toList = M.toList

computeForList :: [Int] -> FactorTable
computeForList = L.foldl' insert empty . L.sort . unique

insert :: FactorTable -> Int -> FactorTable
insert _ 0 = error "0 is not a valid divisor"
insert table n = M.insert n divisors table
  where divisors = filter (`divides` n) candidates
        -- Note: Because the numbers we insert are coming in
        -- already sorted, we only have to check prior keys.
        candidates = M.keys table

empty :: FactorTable
empty = M.empty

divides :: Int -> Int -> Bool
divides x y = y `mod` x == 0

unique :: Ord a => [a] -> [a]
unique = S.toList . S.fromList

----------

-- Note: These functions aren't used. They're simply illustrations
-- of how to invert the factoring procedure so that divisors point to
-- divisees rather than the other way around. As you can see, they're
-- very simple modifications of `computeForList` and `insert` above.

computeForList' = L.foldl' insert' empty . reverse . L.sort . unique

insert' table n = M.insert n divisees table
  where divisees = filter (n `divides`) candidates
        candidates = M.keys table
