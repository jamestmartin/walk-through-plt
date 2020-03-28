module Book where

open import Agda.Builtin.IO
open import Agda.Builtin.Unit

postulate
  forever : IO ⊤ → IO ⊤
  _and_ : {A B : Set} → IO A → (A → B) → IO B
  _then_ : {A B : Set} → IO A → (A → IO B) → IO B

-- Let's suppose you want a simple calculator program that can do arithmetic for you.
module Calculator where
  -- For simplicity, for now, we'll stick to the natural numbers, addition, multiplication, and exponentiation.
  open import Agda.Builtin.Nat using (_+_) renaming (Nat to ℕ; zero to Z; suc to S; _*_ to _×_)
  -- In case you've forgotten what a natural number is, it is the counting numbers: `0, 1, 2, 3, ...`,
  -- but not negatives or fractions.

  -- You can input simple things like `10 * (4 + 3)`, `2 + 2 + 2 + 2`, or even just `5`.
  data Expression : Set where
    lit : ℕ → Expression
    mult add exp : Expression → Expression → Expression

  postulate readInput : IO Expression

  -- The result of calculations like that I hope is very obvious.
  calculate : Expression → ℕ
  calculate (lit a) = a
  calculate (mult a b) = calculate a × calculate b
  calculate (add a b) = calculate a + calculate b
  calculate (exp b e) = {!!}

  postulate writeResult : ℕ → IO ⊤

  -- The calculator program will read in your input like I described above, and print the result.
  main : IO ⊤
  main = forever ((readInput and calculate) then writeResult)

-- TODO: replace with polynomials

-- Perhaps you'd like to calculate something a bit more complicated, like the cube of `10 * (4 + 3)`.
-- That's the same thing as `(10 * (4 + 3)) * (10 * (4 + 3)) * (10 * (4 + 3))`, right?
-- That's really a pain to type though, so you're probably more likely to enter that as:
--     >> 10 * (4 + 3)
--     70
--     >> 70 * 70 * 70
--     343000
-- Instead of:
--    >> (40 + (2 * 4)) * (40 + (2 * 4)) * (40 + (2 * 4)) + (40 + (2 * 4))
--    110640
-- You do:
--    >> 40 + (2 * 4)
--    48
--    >> 48 * 48 * 48 * 48
--    110640
-- You know that when you enter `40 + (2 * 4)`, the calculator is going to give you back some number (48),
-- and that number is going to be the same no matter how many times you calculate `40 + (2 * 4)`.
-- Therefore, every time you see `40 + (2 * 4)`, if you replace it with just `48`, you're going to get the same result.
-- Because 48 is a lot easier to type than `40 + (2 * 4)`, you're probably going to want to do that.
--
-- That said, if you try to apply the same process to larger numbers, the process starts to break down:
--    TODO: example
-- That's really hard to type even still, and it's error-prone too.
-- It's easy to accidentally swap up two characters.
--    TODO
-- There's a pattern here. There's some expression (TODO: define expression) that you have to write out a bunch of times,
-- and there's a value that's simpler to type, so instead you write it just once and replace every place you saw it with its value.
-- The process of replacing something with something else that behaves the same way (i.e. reduces to the same value, TODO explain) is called **substitution**.
--    TODO: the essential notion that `40 + (2 * 4)` and `48` are fundamentally *the same thing*.
--    define notion of equivalence, and use that to build up substitution
--    or maybe delay that and introduce confluence later?
-- Fortunately, substitution is more than a name; we can add it to our calculator.
-- TODO: add *let*
--  * not restricted to just one instance of let
--  * expand the syntax to make nested `let`s easier
--  * add another form of `let` that's a bit more persistent
--    * explain how redefinitions work.
--      * `let x = 4; let y = x; let x = 10`-- y is 4, not 10)
--      * the same principle as it applies to shadowing
--      * maybe deliberately forbid variable redefinitions to explain alpha-conversion later?
-- TODO: lets can cross over each other, except for when they are interdependent
-- TODO: opposite problem, evaluate same polynomial with multiple inputs (lambdas!)
--  * include IPA to describe lambda
--  * not restricted to just one argument
--  * explicit function applications?
--  * expand the syntax to allow multiple arguments
--  * compare to `f(x)` style functions
