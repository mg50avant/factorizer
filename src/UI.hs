module UI where

class (Monad m) => UI m where
  printLine :: (Show a) => a -> m ()
  readLine :: m String
