# A Walk Through PLT
*A Walk Through PLT* is a book that, bit by bit,
explains many important concepts in the field of Programming Language Theory (PLT).
It begins with simple concepts that people already understand (a calculator that does arithmetic)
and slowly builds it into a real programming language,
along the way explaining concepts like polymorphism, dependent types, linearity, call/cc, and more.

## What will this book do for me?
This book is about what programming language theory can do for you.
You will learn about:
* how cutting-edge features can make writing difficult algorithms easier
* how the compiler can be made to write your code for you
* how you can use the new concepts introduced to more easily write better code
* how you can make a better *tool* for programmers

This purpose of this book is *not* to teach specific concepts, like type theory or category theory;
although these things will be covered, what this book is really about is *tools for writing code*.
The theory is really just incidental.

It is for both programming language designers who want to make a better language,
and programmers who want to be one of the first to know how to use these new tools.

It will also serve as an introduction to programming language theory, providing you with the background you need to be able to explore the topic further, since many papers (and even blog posts) assume a great deal of theoretical background.

Finally, I hope that reading this book will make you a better programmer.
The concepts and intuitions built in this book work not only as programming language *features*, but also as *design patterns* and best practices as part of everyday programming, even when the programming language doesn't allow you to express them directly.

## What sorts of things will this book cover?
Without going into any real detail (for that, see the outline):
* New features that you're unlikely to be familiar with and their applications.
* New models for thinking about how programs behave (and even how to write proofs!).
* How to break down hard problems and create good abstractions.
* Common terms and notation, history, well-known figures, communities, and even jokes of the field.
* How you can be one of the cool kids, like the Haskellers and Rustaceans.

## Why this book?
Every concept explained in the book will include:
* clear, concrete, self-contained explanations
* strong motivating examples for programmers
* a executable implementation that you can play with, *right now*
* IPA pronunciations for new words when they're introduced
* an explanation of what every new symbol (e.g. Σ) introduced, including:
    * its name (e.g. Sigma (/'sɪg.mə/))
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

## What motivated you to write this book?
The primary motivation for writing this book is *my* education.
I've learned a lot of PLT over the last few years, but often find myself struggling to explain what I do or why I do it.
This book gives me an opportunity to strengthen my understanding by forcing myself to justify my beliefs, and implement every system I claim to understand.
My ultimate goal is to be able to talk about what I do with friends, family, acquaintences, and potential employers (which currently, I can't really... well, at all).

In the long run, if this project turns out well, I hope to transform it into a valuable resource for other programmers who are interested in PLT (as the book is written to imply).
However, that's not my primary goal of writing this.
Even if I do not achieve that, I will still consider the book a success.

## License
I intend for the licenses to be CC BY-SA for the text and GPLv3+ for the associated code.
However, I still need to figure out exactly how I can apply both of these licenses to a single work,
so for now I'm leaving the project unlicensed (i.e. all rights reserved).
Until I get the license situation figured out, if you want to contribute,
you will have to assign the copyright ownership of your contributions to me.
