module Data.Product where

record Σ {A : Set} (F : A → Set) : Set where
  constructor _,_
  field
    prj₁ : A
    prj₂ : F prj₁

infix 10 _×_
_×_ : Set → Set → Set
A × B = Σ λ (_ : A) → B
