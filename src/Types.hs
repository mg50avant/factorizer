module Types where

import Control.Monad
import Control.Monad.Trans.State

import qualified Data.Map as M

type FactorizerM = StateT (M.Map String String) IO
