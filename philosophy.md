# The Philosophy of the Book
The computation is more fundamental than the types. Type theory feels seriously overemphasized. *The types are just annotations that get stripped away* (even typeclasses are just implicit parameters, although types *are* necessary to meaningfully infer them).
It doesn't help that I'm trying to build up *computational* ideas. Types *limit* computational ideas. That's the opposite of what I want. I'll add types after I explain the computation.

## History and Culture
Although history can be boring if over-emphasized, and history definitely isn't the point of this book
(not to mention I don't know much about the history because I haven't been around very long),
I still believe it would be valuable to cover when I see the chance.

It would also be valuable to describe many famous figures in the field. (e.g. those who are universally known by even just a few letters)
(and of course I should thank those "lesser" figures who have contributed, both in person and by e.g. their own work)

I need to cover notation beyond the notation that I'm going to be using personally, so that people will actually be able to understand other peoples' articles and papers.

Finally, if I could capture any valuable parts of PLT culture, that would be good.
To be honest, I don't really know what PLT culture would *mean* though.
I think at the very least some jokes (like I'm accumulating in the Jokes section of Ideas) would be a good start.

## Why people would want to read it
explains cool features that people are unlikely to be familiar with:
* substructural type systems
   * application in Rust
      * Rust is more closely related to uniqueness types than strictly linear types
   * process calculi? multithreading is *hard*, so it'd be good to have a way to think about it
* fexprs and macros
   * various approaches to macros
* continuations, undelimited and delimited
* codata: how to naturally work with potentially infinite data structures, and use them to find elegant solutions to problems that might otherwise be hard
* parametric polymorphism, type constructors, and parametric polymorphism *over* type constructors: unfamiliar to C programmers, or even e.g. Java programmers who just never learned it
* dependent types
   * for a sufficiently specified type, you have *value* inference
   * tactics and proof assistants
* effects and *coeffects*
* univalence: automatically convert code that uses one abstraction to use another?
* typeclasses and constraints?

helps with how you reason about things:
* better recognize invariants of abstractions and what properties they have
   * even if you're not interested in dealing with it in actual types or writing proofs, it's still useful to think about, and now you have the framework for it
   * helps you design abstractions and avoid exposing unnecessary implementation details
   * gives you a vocabulary to use to speak about abstractions (and have them explained to you)
* more easily design algorithms by more easily recognizing each case that needs to be handled, and dealing with it properly
* learn to deal with hard problems the functional way: just keep breaking them down into smaller problems until the solution to each small problem is obvious
* less useful in practice, but hey, now you know how to write proofs and formally verify programs
   * it's like unit tests, but you know for a fact that it's exhaustive
      * write better unit tests by knowing which cases and properties to cover!
* understand covariance and contravariance, a source of gotchas and bugs
* better understand design principles like LSP (will I cover this?) and methodologies like TDD (because you can write tests that directly correspond with desired properties)

side benefits:
* you should be able to use functional programming languages now!

social benefits:
* understand what the cool kids (haskellers and co., lispers, rustaceans) are talking about

The book should be written Dale Carnegie style: always compelling, and focusing on what I can do for the reader, never on what *I* want.

### The kinds of reasons you might be interested in any given thing
* Actual concrete features: because you can *do* stuff with them
   * but you can't introduce them too quickly, or you'll run into issues with the blub paradox
   * some concrete features are only relevant to some PLs, e.g. effects systems aren't interesting to a C programmer! (maybe coeffects are?)
* Formal semantics: because it's relevant to writing correct code and describing the behavior of features
   * it's hard to convince programmers to care, because it has no direct application
   * it's necessary to explain concrete features (I think?), but you can't introduce too much or people will get bored of it and question why it's being done
* Methods of reasoning: techniques for writing code
   * useful, but extremely hard to justify (because it can't be captured by small examples)


Problems:
* People have the expectation that what they already know will immediately apply, but conventional programming languages behave in complicated ways that are hard to describe in a theoretical setting
* Getting concepts from conventional languages to interop nicely with concepts from PLT is really hard


Pulled three ways:
* I need to model real-world languages as quickly as possible so that programmers can see how the concepts fit into a real-world setting. I can't use a real-world language directly because their semantics aren't well-behaved enough to study theory.
* I need to introduce new features and ideas at a fast enough pace that people stay enagaged, but not *too* quickly or they'll fall into blub paradox/"why do I need that when I can do this?"
* I need to introduce a whole bunch of boring stuff about semantics so I actually have a vocabulary to explain what's going on and why things are useful, but semantics are hard to justify directly in a compelling way ("eat your vegetables, they're good for you.") I do believe that semantics is inherently useful on its own as a framework for thinking about the behavior of actual programs (not just PLs), but it's extremely difficult to describe why. (like the "learning lisp will make you a better programmer" cliche)

Pulled 3 ways, attempt 2:
1. I can't realistically explain features in the context of conventional languages, but I need to explain their pragmatic value in a context programmers are sufficiently familiar with.
   * ... because the language lacks features or has poor semantics that makes them awkward to use:
      * like trying to explain filter/map/reduce in Java before it had generics or lambdas
      * like trying to write algorithms that take advantage of lazy data structures in a strict language where you have to manually deal with your thunks
   * ... because the language has semantics that are inherently incompatible with it:
      * like trying to use Rust-style lifetimes in C
      * like trying to show the value of dependent types in Python
2. I need to introduce new features (and applications) at a rate that keeps people engaged, but how easily I can introduce and explain new features is directly dependent on how much "pure" theory I've covered.
3. With features, I can show specific examples about why something is interesting. On the other hand, the "pure" theory (e.g. semantics, various models of reasoning) is very difficult to justify directly because it has to do with how you reason about programs on a *large* scale, and therefore can't be captured in small examples. It's possible to make connections between theoretical models and the actual sort of things that programmers do, but general examples are difficult, and it's hard to understand what that connection really means until you actually understand the theory in the first place. Compare to: "eat your vegetables; they're good for you" and "learning lisp will make you a better programmer".
