module Parse where

import Text.Read

parse :: String -> Maybe [Int]
parse = readMaybe
