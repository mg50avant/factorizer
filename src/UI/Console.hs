{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE FlexibleInstances #-}

module UI.Console where

import Control.Monad
import Control.Monad.IO.Class

import UI

instance (MonadIO m) => UI m where
  printLine = liftIO . putStrLn . show
  readLine = liftIO getLine
