# The Calculator
```agda
module WalkThroughPLT.Calculator where

```
## The trivial calculator
Doing arithmetic by hand can be tedious and error-prone.
Fortunately, we can enlist the help of a computer to do it for us.
I have written a simple program which can perform arithmetic.
When you run it, it will prompt you for input:
```text
>> 
```
Right now, there are only three things you can ask it to do: addition (written `+`), multiplication (written `*`), and exponentiation (written `^`).
Furthermore, it only works on the natural numbers (`0, 1, 2, 3, ...`), not negative numbers or fractions or decimals.
When you give it input, it will calculate what you asked it to calculate, and tell you the result.
Afterwards, it will prompt you for input again, until you close the program using `Ctrl-c` (denoted `^C`).
For example:
```text
>> 1 + 2
3
>> 3 ^ 3
27
>> 87 * 191231
16637097
>> ^C
```
This may be too limited to be a useful calculator so far, but we will be teaching it new things, and before you know it, it will be able to do just about anything.

```agda
open import Agda.Builtin.Equality using (_≡_; refl)
open import Data.Nat using (ℕ; _+_; _×_; _↑_)
open import Data.Product using (Σ; _,_) renaming (_×_ to _××_)
open import Data.Unit using (⊤)
open import System.IO using (IO; forever; _<&>_; _>>=_)

module Trivial where
  data Expression : Set where
    add mult exp : ℕ → ℕ → Expression

  calculate : Expression → ℕ
  calculate (add a b)  = a + b
  calculate (mult a b) = a × b
  calculate (exp b e)  = b ↑ e

  -- These functions are implementation-dependent and will be defined later.
  postulate
    readInput : IO Expression
    writeResult : ℕ → IO ⊤

  main : IO ⊤
  main = forever (readInput <&> calculate >>= writeResult)
```

We're likely going to want to do calculations which are more complicated than `1 + 1` and `2 * 2`,
for example `1 + (2 * 2)` or `5 ^ (2 + 1)`, or maybe even `3^3 + 2*(3^2) + 2*3 + 1`.

We can already do that to some extent, but it is, like doing arithmetic by hand, tedious and error-prone:
```text
>> 3^3
27
>> 3^2
9
>> 2*9
18
>> 27+18
45
>> 2*3
6
>> 45+6
51
>> 51+1
52
```

You probably already see how I put together each simple operation to (manually) calculate the value of `3^3 + 2*(3^2) + 2*3 + 1`.
Let's be a bit more precise about what I did.

The calculator takes in *two* numbers and an operation (which I will refer to as an **expression**) and gives us *one* number.
Many expressions will give us the same number as an output;
for example, `2 + 2`, `2 * 2`, and `2 ^ 2` all give us `4`.
Another way of saying `2 * 2` gives us `4` is to say that `2 * 2` **reduces to** 4. "Gives us" and "reduces to" both mean the same thing.
I will refer to any two expressions that give the same number as output **joinable**, e.g. `2 + 2` is joinable to `2 * 2` because they reduce to 4.
```agda
  -- `e` reduces to `n` if `calculate e` equals `n`
  ReducesTo : Expression → ℕ → Set
  ReducesTo e n = calculate e ≡ n

  -- `e` is joinable to `e′` if there exists some `n` such that both `e` and `e′` reduce to `n`.
  _↓_ : Expression → Expression → Set
  _↓_ e e′ = Σ λ (n : ℕ) → ReducesTo e n ×× ReducesTo e′ n

  2+2↓2*2 : add 2 2 ↓ mult 2 2
  2+2↓2*2 = 4 , (refl , refl)
```

We currently have the simple concept that an expression reduces to a number.
However, restricting our concepts of expression and reduction to just what the calculator can do so far is very limiting.
*We* know that there are more complex things you can do with addition and multiplication than just `1 + 2` and `2 * 2`, but the *calculator* doesn't.
By restraining our ideas of expression and reduction to just what the calculator already does, we are limiting ourselves.

Expanding beyond the world of the calculator, we can say that numbers themselves are expressions.
An expression is now either an operator applied to two numbers, or a number.
Now, our expressions can look like `1`, `1932 + 2`, `15`, `12 * 2`, and so forth.
We also defined reduction in terms of "whatever the calculator would do",
so we'll have to decide upon what number a *number* should reduce to: a number reduces to itself.
Our definition of joinability can remain the same: two expressions are joinable if they both reduce to the same number.
However, we get new examples of joinable expressions, for example: `2 * 2` is joinable to `4` because `2 * 2` reduces to 4 (because the calculator says so) and `4` reduces to `4` (because we say so),
and likewise that `4` is joinable to `2 + 2`, and even `4` is joinable to `4`.
```agda
  data Expression′ : Set where
    -- An expression is now either an expression as it was defined before ...
    expr : Expression → Expression′
    -- ... or a number.
    lit : ℕ → Expression′

  ReducesTo′ : Expression′ → ℕ → Set
  ReducesTo′ (lit n) n′ = n ≡ n′
  ReducesTo′ (expr e) n = ReducesTo e n

  _↓′_ : Expression′ → Expression′ → Set
  e ↓′ e′ = Σ λ (n : ℕ) → ReducesTo′ e n ×× ReducesTo′ e′ n

  2*2↓′2+2 : expr (mult 2 2) ↓′ expr (add 2 2)
  2*2↓′2+2 = 4 , (refl , refl)

  2*2↓′4 : expr (add 2 2) ↓′ lit 4
  2*2↓′4 = 4 , (refl , refl)

  4↓′2+2 : lit 4 ↓′ expr (mult 2 2)
  4↓′2+2 = 4 , (refl , refl)

  4↓′4 : lit 4 ↓′ lit 4
  4↓′4 = 4 , (refl , refl)
```

There's one last way we're going to extend the concept of expressions (for now).
Expressions are made of numbers or operations applied to numbers,
and we have a way to convert expressions into numbers,
so why don't we allow operations to be applied to *expressions* instead of just numbers?
If `e1` and `e2` are expressions, than `e1 + e2` is also an expression,
and we call `e1` and `e2` **subexpressions** of `e1 + e2`.
We already know how to reduce `n1 + n2` when `n1` and `n2` are numbers,
so let's say that if `e1` reduces to `n1` and `e2` reduces to `n2`,
then `e1 + e2` (the expression) reduces to `n1 + n2` (the number).
Now we can take advantage of our new examples of joinability:
`(1 + 1) * 2` is joinable to `4` because `(1 + 1) * 2` reduces to `4` and `4` also reduces to `4`.
```agda
  data Expression′′ : Set where
    lit′ : ℕ → Expression′′
    add′ mult′ exp′ : Expression′′ → Expression′′ → Expression′′

  -- TODO: prove the rest of the stuff as above
```

So now we know enough for me to describe how I used the calculator to reduce `3^3 + 2*(3^2) + 2*3 + 1`:
1. For clarity, I will write `3^3 + 2*(3^2) + 2*3 + 1` as `3^3 + (2*(3^2) + (2*3 + 1))`. It should be obvious that these are exactly the same.
1. `3^3 + (2*(3^2) + (2*3 + 1))` is an operator applied to two subexpressions: `3^3` and `2*(3^2) + (2*3 + 1)`. Since the calculator only understands an operator applied to numbers, I must first reduce each subexpression to a number.
2. `3^3` is an operator applied to two subexpressions, `3` and `3`. `3` (the expression) reduces to `3` (the number), and therefore I can ask the calculator to reduce `3^3` (the result is 9).
3. Next, I must find out what `2*(3^2) + (2*3 + 1)` reduces to. Again, it is an operator applied to two subexpressions, `2*(3^2)` and `2*3 + 1`. I must first reduce each subexpression to a number.
4. `2*(3^2)` is an expression applied to two subexpressions, `2` and `3^2`. I must first reduce each subexpression to a number.
5. `2` reduces to `2`.
6. `3^2` ...
TODO: the rest of this tedious crap. I need to go to bed.

Some properties:
1. You know that whenever you see `(40 + (2 * 4))` that it is *always* going to simplify to `48`, no matter how many times you type it, and no matter where it shows up.
   * whenever you see it, you can replace it with 48
   * 48 simplifies to itself
   * TODO: the notion as a whole is called purity/referential transparency (or at least this is half of what it means)
     * also confluence
2. When you ask the calculator to do something, the result is *simpler* than what you put in (and usually requires fewer characters to type, too).
   * TODO: What does it mean for something to be simpler? relative simplicity in terms of reduction steps
      * "simpler" probably has to be defined in terms of reduction steps
      * no further reduction steps apply to `48`; infinitely many terms (or should I say expressions??) reduce to `48`
      * this basically requires getting into evaluation strategies already, and it's far too early for that
   * this isn't actually strictly necessary for substitution as a whole; it's just why we want to do it in this *particular way*
      * by introducing this now, we're introducing reduction strategies a lot earlier than we'd want to

When two expressions are joinable, you can replace one with the other as a subexpression and get exactly the same result. (TODO: referential transparency, again)
The act of replacing a subexpression with an equivalent expression is called **substitution** (TODO: IPA).

Because 48 is a lot easier to type than `40 + (2 * 4)`, you're probably going to want to do that.
That said, if you try to apply the same process to larger numbers, the process starts to break down:
```text
TODO: example
```
That's really hard to type even still, and it's error-prone too.
It's easy to accidentally swap up two characters.
```text
TODO
```
Fortunately, substitution is more than just a name for something we do;
it's another thing we can make our calculator do for us.

TODO: add *let*
   * not restricted to just one instance of let
   * expand the syntax to make nested `let`s easier
   * add another form of `let` that's a bit more persistent
      * explain how redefinitions work.
         * `let x = 4; let y = x; let x = 10`-- y is 4, not 10)
         * the same principle as it applies to shadowing
         * maybe deliberately forbid variable redefinitions to explain alpha-conversion later?
TODO: lets can cross over each other, except for when they are interdependent
TODO: opposite problem, evaluate same polynomial with multiple inputs (lambdas!)
   * include IPA to describe lambda
   * not restricted to just one argument
   * explicit function applications?
   * expand the syntax to allow multiple arguments
   * compare to `f(x)` style functions
