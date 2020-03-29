{-# OPTIONS --without-K #-}
module System.IO where

open import Agda.Builtin.IO using (IO) public
open import Data.Unit using (⊤)

infixl 1 _>>=_

postulate
  forever : IO ⊤ → IO ⊤
  _<&>_ : {A B : Set} → IO A → (A → B) → IO B
  _>>=_ : {A B : Set} → IO A → (A → IO B) → IO B
