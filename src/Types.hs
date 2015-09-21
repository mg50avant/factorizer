{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Types where

import Control.Applicative
import Control.Monad
import Control.Monad.Trans.State

import qualified Data.Map as M


type FactorTable = M.Map Int [Int]

newtype FactorizerM a = FM { runFactorizerM :: StateT (M.Map String String) IO a }
                      deriving (Functor, Applicative, Monad)
