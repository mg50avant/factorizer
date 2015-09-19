module Cache where

class (Monad m) => Cache m where
  cacheWrite :: (Show a, Show b) => a -> b -> m ()
  cacheRead :: String -> m (Maybe String)
