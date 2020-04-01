# A Walk Through PLT
Please read README.md for context about the book.

"There are two ways of constructing a software design: One way is to make it so simple that there are obviously no deficiencies, and the other way is to make it so complicated that there are no obvious deficiencies. The first method is far more difficult." -- Tony Hoare

Programming language theory (or PLT) is a branch of computer science that deals with, among other things, the design, implementation, and analysis of programming languages.
However, even if you are not making a programming language, PLT is still relevant to you.
I believe that by learning about PLT, you will:
* Be able to design more effective abstractions, which makes programming easier and less error-prone
* Be better able to reason about your code and data, so that you can write clearer code with fewer bugs

You can safely ignore the source code listed;
it is the formal proof associated with the statements I make.
Hopefully by the end of this book, you'll be able to understand it.

First, I would like to address a bit of elitism:
We will also not be restricting ourselves solely to functional programming languages.
Although it is typically easier to describe the behavior of programs in functional programming languages than others,
that does not imply that other paradigms are somehow less valid.
Non-functional programming languages are not at all less legitimate than functional ones,
and programs written in those languages are no less legitimate than those written in functional languages.
Rather, imperative programming languages have shown themselves to be highly effective tools in programming practice,
and we should seek to better understand their behavior so that we have a better model for understanding the sort of code that programmers actually write,
and so that we may discover new concepts and recognize new patterns that programmers find useful,
so we can make programming languages which better fit the sort of work that programmers actually do.

On the other hand, the imperative programmer should not dismiss the value of *functional* programming languages.
The semantics of functional languages are very well behaved and simple to describe,
(in fact, their semantics are *so* well-behaved that some of them are suitable for doing mathematical proofs)
making it easier to reason about the behavior of (and also refactor) functional programs,
which also makes them an excellent testbed for new programming language features.
These properties *also*, in my opinion, make them useful for *programming*, but many programmers, for one reason or another, are either unwilling or unable to use them as part of everyday work.
Nonetheless, even if you are not interested in using them directly, there are many valuable lessons that you may find in them.

```agda
module WalkThroughPLT where
```
