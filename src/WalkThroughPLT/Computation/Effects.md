# Effects
Our current language has a very interesting property:
the order in which you evaluate expressions has no effect on the result of the computation
(up to computational complexity (?) and termination/errors). (https://www.reddit.com/r/haskell/comments/21y560/purity_and_referential_transparency_are_different/)
This is a property known as "purity".

Purity allows us to perform powerful rewrites like:
* running a program in parallel
* merging two loops into one
* splitting a loop into two, and then running each loop in parallel
* ... other examples not around loop orderings

Compilers are stupid, so if something allows a *compiler* to do smart stuff like that,
it's going to help a *programmer* do a *lot* more. It helps greatly with refactoring.
Purity is a very valuable property for a programming language to have!

Unfortunately, purity comes to the exclusion of one very important thing: side-effects.
Programs need side-effects to, you know, *do* things.
Unfortunately, we're going to have to give up our purity for now,
but we'll be able to recover something similar to it again later on, in the 'Effect Systems' section.

It is possible to add features so that this is no longer the case.
These are known as **effects**, e.g. mutability, IO, ...

To meaningfully be able to define the behavior of these expressions, we'll have to define an evaluation order.
* If we use call-by-value, we can no longer use potentially-infinite data structures.
* If we use call-by-name, effects may be performed *any* number of times, in an unpredictable order.
* If we use call-by-need, things are also unpredictable.
* Non-deterministic evaluation orders, like evaluating in parallel, are right out.

Call-by-value (CBV) is obviously the most predictable, useful system for using effects.
So how can we keep the power of our infinite data structures?

1. Monads. Monads allow effects, but only in certain conditions, and require you to define an order using `>>=`. This is a bad solution because it doesn't compose well.
2. Uniqueness types. You are forced to thread `IO` through your computation. This is a pain and we're not ready for types yet.
3. Call-by-push-value: split CBV and CBN into separate universes, so we can have effects in the CBV system and infinite data structures in CBN. They are interdependent, but strictly separated.

We'll use CBPV here because it's the best solution [citation needed].
We'll still lose purity, but that's necessary to be able to write real programs, and we'll be able to re-introduce *relative* purity later with effects systems.
