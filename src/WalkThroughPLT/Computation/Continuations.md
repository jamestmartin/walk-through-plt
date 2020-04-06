# Continuations
monads are necessary in Haskell is that they enforce a particular order in which things are evaluated. Haskell is non-strict (the spec doesn't even officially say that it's lazy!), which means you have no idea if, when, or even how many times any given piece of code is going to be run.

you don't need monads to do stuff like IO. Haskell can't do IO without monads, but you can just use statements.
that said, there are some things that monads can accomplish that statements can't. Statements can handle stuff like state and IO, but not e.g. the list monad.
that said, you don't need monads to accomplish that either, if you add continuations

Continuations allow control flow with backtracking.
