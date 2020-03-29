{-# OPTIONS --safe --without-K #-}
module Data.Nat where

open import Agda.Builtin.Nat
  using (_+_)
  renaming (Nat to ℕ; zero to Z; suc to S; _*_ to _×_)
  public

-- | Exponentiation
_↑_ : ℕ → ℕ → ℕ
b ↑ Z   = 1
b ↑ S e = b + (b ↑ e)
