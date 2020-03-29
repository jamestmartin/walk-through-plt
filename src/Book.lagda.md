# A Walk Through PLT
Please read README.md for context about the book.

You can safely ignore the source code listed;
it is the formal proof associated with the statements I make.
Hopefully by the end of this book, you'll be able to understand it.

```agda
{-# OPTIONS --without-K #-}
module Book where
```

## The calculator
Let's suppose you want a simple calculator program that can do arithmetic for you.
```agda
module Calculator where
```

For simplicity, for now, we'll stick to the natural numbers, addition, multiplication, and exponentiation.
```agda
  open import Data.Nat using (ℕ; _+_; _×_; _↑_)

  data Expression : Set where
    literal : ℕ → Expression
    add mult exp : Expression → Expression → Expression
```
In case you've forgotten what a natural number is, it is the counting numbers: `0, 1, 2, 3, ...`, but not, for example, negatives or fractions.

The calculator will prompt you using `>> ` to give it some input, in the format you'd expect
(e.g. `(4 + 7)^3`, `10 + (4 * 3)` or `2 + 2 + 2 + 2` or `182`),
with the caveat that you have to write out the multiplication operator (e.g. `2(3 + 4)` is not okay, but `2*(3+4)` is)
calculate what you asked it to calculate, and give you back the result.
Type `Ctrl-c` to exit the program.
```agda
  open import Data.Unit using (⊤)
  open import System.IO using (IO; forever; _<&>_; _>>=_)

  postulate
    readInput : IO Expression
    writeResult : ℕ → IO ⊤

  calculate : Expression → ℕ
  calculate (literal a) = a
  calculate (add a b) = calculate a + calculate b
  calculate (mult a b) = calculate a × calculate b
  calculate (exp b e) = calculate b ↑ calculate e

  main : IO ⊤
  main = forever (readInput <&> calculate >>= writeResult)
```

How this looks is pretty simple:
```text
>> 123123
123123
>> 10 + 3
13
>> 8 * 4 + 3 ^ (2 * 2)
113
>> ^C
```

But perhaps you'd like to calculate something a bit more complicated than that,
for example something that looks like something like this:
```text
2*(10 * (4 + 3))^3 + 5*(10 * (4 + 3))^2 + 8*(10 * (4 + 3)) + 7
```

You could certainly just type that in to the prompt to calculate it:
```text
>> 2*(10 * (4 + 3))^3 + 5*(10 * (4 + 3))^2 + 8*(10 * (4 + 3)) + 7
7117067
```
but I'm guessing you've noticed by now that `10 * (4 + 3)` sure comes up a lot in there.
You could save yourself a lot of work if you only had to type it once:
```text
>> 10 * (4 + 3)
70
>> 2*70^3 + 5*70^2 + 8^70 + 7
7117067
```
Similarly, instead of:
```text
>> (40 + (2 * 4))^3 * 2*(40 + (2 * 4))^2 + (40 + (2 * 4))
509607984
```
I bet you'd rather do: (TODO: it saves your fingers, error-prone)
```text
>> 40 + (2 * 4)
48
>> 48^3 + 2*48^2 + 48
509607984
```

It certainly saves a lot of typing, but why exactly does that work? (TODO: clarify what "it" is, exactly)
1. You know that whenever you see `(40 + (2 * 4))` that it is *always* going to simplify to `48`, no matter how many times you type it, and no matter where it shows up.
   * whenever you see it, you can replace it with 48
   * 48 simplifies to itself
   * TODO: the notion as a whole is called purity/referential transparency (or at least this is half of what it means)
     * also confluence
   * TODO: formalize idea of a subexpression to clarify "where it shows up"
2. When you ask the calculator to do something, the result is *simpler* than what you put in (and usually requires fewer characters to type, too).
   * TODO: What does it mean for something to be simpler? relative simplicity in terms of reduction steps
      * "simpler" probably has to be defined in terms of reduction steps
      * no further reduction steps apply to `48`; infinitely many terms (or should I say expressions??) reduce to `48`
      * this basically requires getting into evaluation strategies already, and it's far too early for that
   * this isn't actually strictly necessary for substitution as a whole; it's just why we want to do it in this *particular way*
      * by introducing this now, we're introducing reduction strategies a lot earlier than we'd want to

When two expressions reduce to the same value, they are equivalent (is equivalent the right term for this? joinable?),
which means that you can replace one with the other as a subexpression and get exactly the same result. (TODO: referential transparency, again)
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
