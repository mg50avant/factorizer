module UI.Console where

import Control.Monad
import Control.Monad.IO.Class

import UI
import Types

instance UI FactorizerM where
  printLine = FM . liftIO . putStrLn . show
  readLine = FM (liftIO getLine)
