{-# LANGUAGE TypeOperators #-}

module Expr where

data a :-> b
infixr 5 :->

data Source a = Source a deriving Show
data Destination a = Destination a deriving Show

class EDSL expr where
  lam :: (expr a -> expr b) -> expr (a :-> b)
  λ :: (expr a -> expr b) -> expr (a :-> b)
  λ = lam
  app :: expr (a :-> b) -> expr a -> expr b
  (☯) :: expr (a :-> b) -> expr a -> expr b
  (☯) = app
  dep :: expr (Source a) -> expr (Destination b)
  (⇇) :: expr (Source a) -> expr (Destination b)
  (⇇) = dep
