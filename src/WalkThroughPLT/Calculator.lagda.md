# The Calculator
```agda
module WalkThroughPLT.Calculator where
```
Although I am sure you are anxious to jump directly to speaking about all of the new features and tricks PLT can bring you,
before we can describe new programming language features, we must first describe what we already know.
In other words, to add features to a programming language, we must first have a programming language to add features to.

It is my goal to get us to a "real" programming language as quickly as possible.
By "real" I mean one that you could realistically use for programming, even if it is a bit simplistic!
Our "real" programming language will be rather simplistic, but will include indispensible features like IO and universal computation.

## The trivial calculator
```agda
module Trivial where
```
Doing arithmetic by hand can be tedious and error-prone.
Fortunately, we can enlist the help of a computer to do it for us.
I have written a simple calculator program which can perform three operations: addition (written `+`), multiplication (written `*`), and exponentiation (written `^`).
Furthermore, it only works on the natural numbers (`0, 1, 2, 3, ...`), not negative numbers or fractions or decimals.
```agda
  open import Data.Nat using (ℕ; _+_; _×_; _↑_)
```
It accepts input in a simple format: a number, followed by an operation, followed by another number.
I will refer to the things which are valid input to the program as **expressions**.
```agda
  data Expression : Set where
    [_+_] [_*_] [_^_] : ℕ → ℕ → Expression
```

When you run the calculator, it will prompt you for input.
When you enter an expression, it will perform the operation that it asked you to perform, and then print the result.
Finally, you may exit the program at any time using `Ctrl-c` (denoted `^C`, as is convention in Unix-style shells).
```agda
  open import Data.Unit using (⊤)
  open import System.IO using (IO; forever; _<&>_; _>>=_)

  -- These functions are dependent on which platform the program is running on.
  -- They will be defined later.
  postulate
    promptInput : IO Expression
    printResult : ℕ → IO ⊤
  
  performOperation : Expression → ℕ
  performOperation ([a] op [b]) = doOp op a b

  main : IO ⊤
  main = promptInput <&> performOperation >>= printResult
```
Here is an example of what interacting with the program might look like:
```text
>> 1 + 2
3
>> 3 ^ 3
27
>> 87 * 191231
16637097
>> ^C
```

  
Right now, there are only three things you can ask it to do: 
Furthermore, it only works on the natural numbers (`0, 1, 2, 3, ...`), not negative numbers or fractions or decimals.
When you give it input, it will calculate what you asked it to calculate, and tell you the result.
Afterwards, it will prompt you for input again, until you close the program using `Ctrl-c` (denoted `^C`).
For example:
```text
```
This may be too limited to be a useful calculator so far, but we will be teaching it new things, and before you know it, it will be able to do just about anything.

```agda
  open import Agda.Builtin.Equality using (_≡_; refl)
  open import Data.Product using (Σ; _,_) renaming (_×_ to _∧_)

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

First, some definitions:
* **Expressions**: Something you can ask the calculator to calculate. Right now, these consist of two numbers and an operator (e.g. `2`, `3`, and `+` can be made into the expression `2 + 3`).
* **Reduction**: When you give the calculator an expression as input, it gives you back a number. We say that the expression (e.g. `3 * 2`) *reduces to* that number (e.g. `6`), e.g. `3 * 2` *reduces to* `6`.
  * We also may use the symbol `e ↦ n` ("maplet", read "`e` reduces to `n`"; TeX: `\mapsto`, Agda: `\r6`), e.g. `3 * 2 ↦ 6`.
```agda
  _↦_ : Expression → ℕ → Set
  e ↦ n = calculate e ≡ n
```

Make note of these properties of reduction:
1. Every expression reduces to some number, or in other words, there are no expressions that don't reduce to any number.
2. Every expression *only* reduces to *one* number (e.g. `2 + 2` reduces to `4`, and never anything else, like, say, `5`), but *many* expressions may reduce to the *same* number (e.g. `1 + 1` reduces to `2`, and so does `2 * 1`).
```agda
  ↦-exists : (e : Expression) → Σ λ (n : ℕ) → e ↦ n
  ↦-exists e = calculate e , refl

  isUnique : Set → Set
  isUnique A = Σ λ (x : A) → (y : A) → x ≡ y

  ↦-unique : (e : Expression) → isUnique (Σ λ (n : ℕ) → e ↦ n)
  ↦-unique e = ↦-exists e , λ { (.(calculate e) , refl) → refl }
```

We can take advantage of that second property to define something new: **equivalence**.
If `e₁` reduces to `n` and `e₂` *also* reduces to `n`, then we say that `e₁` is *equivalent to* `e₂`.
We also use the symbol `e₁ ≡ e₂` ("triple bar", read "`e₁` is equivalent to `e₂`"; TeX: `\equiv`).
A few examples:
* `1 + 1` reduces to `2` and `2 * 1` reduces to `2`, therefore `1 + 1` is equivalent to `2 * 1` (`1 + 1 ↦ 2` and `2 * 1 ↦ 2`, therefore `1 + 1 ≡ 2 * 1`).
* `2 ^ 2` reduces to `4` and `2 * 2` reduces to `4`, therefore `2 ^ 2` is equivalent to `2 * 2` (`2 ^ 2 ↦ 4` and `2 * 2 ↦ 4`, therefore `2 ^ 2 ≡ 2 * 2`).
```agda
  -- We're already using _≡_ to represent the identity type.
  _==_ : Expression → Expression → Set
  e₁ == e₂ = Σ λ (n : ℕ) → e₁ ↦ n ∧ e₂ ↦ n

  ex==₁ : add 1 1 == mult 2 1
  ex==₁ = 2 , (lemma₁ , lemma₂)
    where lemma₁ : add 1 1 ↦ 2
          lemma₁ = refl

          lemma₂ : mult 2 1 ↦ 2
          lemma₂ = refl

  ex==₂ : exp 2 2 == mult 2 2
  ex==₂ = 4 , (lemma₁ , lemma₂)
    -- Fun fact: I actually managed to catch a bug while writing this proof, because I had accidentally defined `2 ^ 2 ↦ 5`!
    where lemma₁ : exp 2 2 ↦ 4
          lemma₁ = refl

          lemma₂ : mult 2 2 ↦ 4
          lemma₂ = refl
```

Equivalence also has a few useful properties:
* **Reflexitivity**: `e` is always equivalent to `e`, for any expression (`e ≡ e`).
* **Symmetry**: If an expression `e₁` is equivalent to `e₂`, then `e₂` is equivalent to to `e₁` (if `e₁ ≡ e₂`, then `e₂ ≡ e₁`).
* **Transitivity**: If `e₁` is equivalent to `e₂` and `e₂` is equivalent to `e₃`, then `e₁` is equivalent to `e₃` (if `e₁ ≡ e₂` and `e₂ ≡ e₃`, then `e₁ ≡ e₃`).
```agda
  variable e e₁ e₂ e₃ : Expression

  ==-reflexive : e == e
  ==-reflexive {e} = calculate e , (refl , refl)

  ==-symmetric : e₁ == e₂ → e₂ == e₁
  ==-symmetric (n , (p₁ , p₂)) = n , (p₂ , p₁)

  ==-transitive : e₁ == e₂ → e₂ == e₃ → e₁ == e₃
  ==-transitive {e₂ = e₂} p₁ p₂ with calculate e₂
  ==-transitive {e₂ = e₂} (.n , (pe₁ , refl)) (.n , (refl , pe₃)) | n = n , (pe₁ , pe₃)
```

This idea of equivalence is very similar to the equality that you're used to from arithmetic.
In fact, every expression we consider equivalent would be consider equal;
just as `2 * 2` is equivalent to `4 ^ 1`, `2 * 2` is equal to `4 ^ 1`.
However, there are many things that we would consider equal that are not equivalent, for example:
* `2 * 2 = 4`, but we can't say that `2 * 2 ≡ 4` because equivalence is defined between *expressions*, and numbers are not expressions.
* `(1 + 1) * 2 = 2 * 2`, but we can't say that `(1 + 1) * 2 ≡ 2 * 2` because `(1 + 1) * 2` is not an expression.

This is because we're restricting our idea of expressions to "things the calculator understands as input".
We *want* to be able to say that `3^3 + 2*(3^2) + 2*3 + 1 ≡ 52`, but we can't because the calculator doesn't understand either of those things.
However, to save ourselves from that tedious and error-prone arithmetic, we want to still use the calculator whenever possible.
We can do this by breaking down `3^3 + 2*(3^2) + 2*3 + 1` into things the calculator *does* understand, and then putting them back together ourselves.

We'll begin by describing what `52` means in `3^3 + 2*(3^2) + 2*3 + 1 ≡ 52`.
First, we know that `≡` is between expressions, so we'll first have to upgrade our idea of expressions.
1. Everything that used to be an expression is still an expression.
2. Numbers are also now expressions.

Next, we know that two expressions are equal if they reduce to the same number, but we've only defined what reduction means on our *old* idea of expressions.
Again, we'll have to upgrade our idea of reduction.
1. If an expression used to reduce to a number, it still reduces to that same number.
2. Our new expressions, the numbers, reduce to themselves (`n ↦ n′` only if `n` and `n′` are exactly the same).
```agda
  data Expression′ : Set where
    -- TODO: Do I want to bring up the (subtle) distinction between `52` and `# 52`?
    #_ : ℕ → Expression′
    expr : Expression → Expression′
  infix 5 #_

  _↦′_ : Expression′ → ℕ → Set
  (# x)  ↦′ n = x ≡ n
  expr x ↦′ n = x ↦ n

  infix 2 _==′_
  -- This is exactly the same as before, just upgraded to our new idea of `↦` (i.e. `↦′`).
  _==′_ : Expression′ → Expression′ → Set
  e₁ ==′ e₂ = Σ λ (n : ℕ) → e₁ ↦′ n ∧ e₂ ↦′ n
```
We can now say things like `52 ≡ 52` or `26 * 2 = 52`.
```agda
  ex==₃ : # 52 ==′ # 52
  ex==₃ = 52 , (refl , refl)

  ex==₄ : # 26 × 2 ==′ # 52
  ex==₄ = 52 , (refl , refl)
```

Now we have to describe what `3^3 + 2*(3^2) + 2*3 + 1` means in `3^3 + 2*(3^2) + 2*3 + 1 ≡ 52`.
Again, we'll need to upgrade our idea of expressions.

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

When two expressions are equal, you can replace one with the other as a subexpression and get exactly the same result. (TODO: the substitution property, referential transparency, again)
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
