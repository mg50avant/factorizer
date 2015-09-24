{-# LANGUAGE FlexibleInstances #-}
module UI.Console where

import Control.Monad
import Control.Monad.IO.Class

import UI
import Types

data ConsoleUI

instance UI (FactorizerM cache ConsoleUI) where
  printLine = FM . liftIO . putStrLn . show
  readLine = FM (liftIO getLine)
