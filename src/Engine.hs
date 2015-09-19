module Engine where

import Cache
import FactorTable (FactorTable, fromList)
import Format (format)
import Parse (parse)
import UI

programLoop :: (Cache m, UI m) => m ()
programLoop = do
  printLine "Please enter a list of numbers (ex. [2, 4, 5, 10]):"
  line <- readLine
  case parse line of
    Nothing -> printLine "Invalid input."
    Just numbers -> do factorTable <- getFactorTable numbers
                       printLine (format factorTable)
  programLoop

getFactorTable :: (Cache m) => [Int] -> m FactorTable
getFactorTable numbers = do
  cacheResult <- cacheRead (show numbers)
  case cacheResult of
    Just serializedFactorTable -> return (read serializedFactorTable)
    Nothing -> do let factorTable = fromList numbers
                  cacheWrite numbers factorTable
                  return factorTable
