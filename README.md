# A Walk Through PLT
*A Walk Through PLT* is a book that, bit by bit,
explains many important concepts in the field of Programming Language Theory (PLT).
It begins with simple concepts that people already understand (a calculator that does arithmetic)
and slowly builds it into a real programming language,
along the way explaining concepts like polymorphism, dependent types, linearity, call/cc, and more.

## What will this book contain?
Every concept explained in the book will include:
* clear, concrete, self-contained explanations, with examples
* an executable implementation that you can play with, *right now*
* a precise explanation and formal verification of every statement made
* strong motivating examples for programmers
* IPA pronunciations for new words when they're introduced
* an explanation of what every new symbol (e.g. Σ) introduced, including:
    * its name (e.g. Sigma (/'sɪg.mʌ/))
    * how it should be read (e.g. "there exists")
    * how you can write it in the Agda input method for Emacs (e.g. `\Sigma` or `\GS`)
  
When possible, I also hope to include:
* exercises
* citations to the papers which introduced each concept
* links to other supplementary resources and explanations

I hope to provide the book in two formats:
* HTML, with inline JavaScript demos
* PDF, with an associated Haskell executable for the demos

Fortunately, Agda supports compiling to both Haskell and JavaScript,
so both of these things should be possible.

### Overview
This section is an overview of what is *already* in the book.
Some of the concepts which I am considering including but have not yet done can be found in `ideas.md`.

1. A simple read/eval/print loop in the form of an arithmetic calculator.
   * An explanation of expressions, equivalence of expressions, and substitution.
   * Introduces `let` expressions and lambda abstractions.

## Why a new book?
The purpose of this book is primarily *my* education.
I have learned a lot about PLT over the last few years,
but often find myself struggling to actually implement and formalize many of the concepts,
or have difficulty explaining the practical application of what I do to everyday programmers.
Writing this book forces me to implement every system I claim to understand,
prove every important property I believe to be true,
and justify exactly why I'd want every feature in a programming language or proof assistant.

However, in the long run, if this project turns out well,
I hope to transform it into a valuable resource for other programmers who are interested in PLT.
Existing resources are often incomplete or vague,
and papers tend to depend so much on prior work
that the number of papers a newcomer needs to read to understand any given topic grows exponentially.
That said, I have no expectation that reading this book will be *easy*;
learning new concepts is inherently hard.
I will be precise and complete, but I will not add any fluff just because the book feels too dense.

## License
I intend for the licenses to be CC BY-SA for the text and GPLv3+ for the associated code.
However, I still need to figure out exactly how I can apply both of these licenses to a single work,
so for now I'm leaving the project unlicensed (i.e. all rights reserved).
Until I get the license situation figured out, if you want to contribute,
you will have to assign the copyright ownership of your contributions to me.
