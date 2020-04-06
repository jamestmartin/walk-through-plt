# Solvers
There is a correspondence between types and logical statements.
Incidentally, logical systems also produce programming languages in a *different* way.
You have calculi, which do computation by removing cuts from the proof or whatever, but you can also do computation by ???. These are known as logic programming languages.

https://github.com/rust-lang/chalk

You can use a limited subset of them to get the typechecker/inferencer to automatically resolve simple things for you like picking what typeclass instance to use.
However, you can also use them to infer *values* for you.
This is usually restricted to simple types where there's a fixed way that will always get an answer (terminates in finite time always), and usually in not too long (don't get the compiler stuck).
However, you can also write your own algorithms to a limited subset of problems, even if the problem of finding a value is undecidable in the general case.
This can be very useful if you can write good algorithms and know when to use them.
You can write a very precise dependently-typed specification, and then ask a solver to basically write a program that meets that specification for you.
