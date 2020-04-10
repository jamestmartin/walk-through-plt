# The Philosophy of the Book
## Thoughts on how I need to introduce stuff
The three kinds of reasons something might matter:
1. Concrete features: because you can *do* things with them
2. Formal semantics: because it's necessary to describe how programs behave (including how features work)
3. Methods of reasoning: techniques for writing code

In introducing topics, I am pulled three ways:
1. I can't realistically explain features in the context of conventional languages, but I need to explain their pragmatic value in a context programmers are sufficiently familiar with.
   * ... because the language lacks features or has poor semantics that makes them awkward to use:
      * like trying to explain filter/map/reduce in Java before it had generics or lambdas
      * like trying to write algorithms that take advantage of lazy data structures in a strict language where you have to manually deal with your thunks
   * ... because the language has semantics that are inherently incompatible with it:
      * like trying to use Rust-style lifetimes in C
      * like trying to show the value of dependent types in Python
2. I need to introduce new features (and applications) at a rate that keeps people engaged, but how easily I can introduce and explain new features is directly dependent on how much "pure" theory I've covered.
3. With features, I can show specific examples about why something is interesting. On the other hand, the "pure" theory (e.g. semantics, various models of reasoning) is very difficult to justify directly because it has to do with how you reason about programs on a *large* scale, and therefore can't be captured in small examples. It's possible to make connections between theoretical models and the actual sort of things that programmers do, but general examples are difficult, and it's hard to understand what that connection really means until you actually understand the theory in the first place. Compare to: "eat your vegetables; they're good for you" and "learning lisp will make you a better programmer".
