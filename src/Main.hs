module Main where

import Control.Monad
import Control.Monad.State

import qualified Data.Map as M

import Types (FactorizerM, runFactorizerM)
import Engine (programLoop)
import Cache ()
import Cache.InMemory ()
import UI ()
import UI.Console ()

main :: IO ()
main = evalStateT (runFactorizerM programLoop) M.empty
