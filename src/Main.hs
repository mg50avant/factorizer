module Main where

import Control.Monad
import Control.Monad.State

import qualified Data.Map as M

import Types (FactorizerM, runFactorizerM)
import Engine (programLoop)
import Cache ()
import Cache.InMemory (InMemoryCache)
import UI ()
import UI.Console (ConsoleUI)

main :: IO ()
main = evalStateT (runFactorizerM program) M.empty
  -- Plug in our in-memory cache and console UI
  where program :: FactorizerM InMemoryCache ConsoleUI ()
        program = programLoop
