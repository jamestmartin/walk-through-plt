# Outline
## After this book, how would I follow up?
This is strictly in the realm of pure fantasy.

1. Programming languages
   * theory naturally progresses into mathematics (and physics?)
   * ??? naturally progresses into linguistics?
      * linguistics and physics are observational, whereas PLT and mathematics are more pure
   * implementation naturally progresses into operating systems
   * I guess maybe I could progress into soft BS like software "engineering"?
2. CPUs & operating systems
3. Networks
4. Video games??
   * Also depends on art, music, and *tons* of design stuff, not just code/graphics.
   
Anyway, I'm not going to worry about this right now for obviously reasons.
Back to this book.

## Outline of Programming Languages
The first three chapters about *what* your options are and *why* each one is valuable.
The next three chapters are about *how* to turn them into a usable programming language.
1. Computation: What can I make my programming language *do*?
2. Mathematics: What can I make my compiler do *for me*?
3. Abstractions: How can I use these new features to more easily write better code?
4. Design: How can I use what I know to design a useful *tool* for programmers?
5. Implementation: How can I build my programming language?
6. Tooling: How can I make my programming language easier to use?

Important, but where does it belong?
* Module systems
* Macros and fexprs

### Outline of Computation
1. A simple model of computation (similar to lambda calculus)
2. Effects, coeffects?
   * Purity, referential transparency
3. Inductive/coinductive datatypes, ADTs
4. The rest of the lambda calculus?
5. Fixpoints, partial functions, totality
6. Continuations (call/cc), delimited continuations
7. Linear TT as a way of embedding multiple evaluation strategies
   * Comparison to CBPV?
   * Benefits by introducing process calculi semantics?
   * Classical LL? Is it implementable even?
   
Other stuff:
* At some point I need to cover CBN/CBV and degrees of strictness (maybe?).
* Macros and fexprs: do they belong in this chapter?
* Probably *all* of the computational semantics I described in ideas.md belongs here

#### Outline of ~~Lambda Calculus~~
I don't think I'm going to present it in this way because the value of lambda calculus per se is questionable.

1. Lambda calculus is defined in terms of higher-order anonymous functions.
   * I should describe first-order, named, multi-parameter functions first.
      * The idiom that allows multiple arguments in LC is dependent on the ability to *return* functions, which seems in some ways separate from the ability to accept functions as arguments.
      * Anonymous functions aren't all that useful compared to named functions without higher-order functions, in particular when they're not needed to emulate `let`.
   * Really it doesn't make sense to jump directly from functions to the lambda calculus at all. I should work with inductive data types first and recursive functions.
      * I don't even need to go directly to full inductive data types with recursion. Non-recursive data types will be sufficient at first. Not to mention I won't need type parameters yet...
        * TODO: Interection types plus bags of atoms vs. structured case? Is this basically sets vs. types?
      * Recursive functions should probably defined in terms of some sort of "magic letrec" before going for a fixpoint operator.
      * Even second-order functions should be introduced before higher-order functions. True higher-order functions are *extremely rare*, and only really relevant for encoding data. This should be introduced only as an advanced concept.
2. Functions are defined in terms of substitution (which can be built-in as `let` expressions).
3. Substitution requires the substitution property.
   * How? I believe this is true, but I need to figure out the connection more precisely.
4. The substitution property is dependent on the idea of equality.
5. The idea of equality is dependent on the idea of equivalence *and* the idea of subexpressions.
6. So I need to define equivalence, which requires the idea of reduction...
7. Which itself requires the idea of expressions, which have to be defined *recursively* so I have a notion of subexpressions.
8. So although I don't need to explain recursive data and induction *yet*, I need it to be understandable at least for expressions.

Some older ideas on this topic:
order:
* calculator: the desire is intuitively obvious
* let expressions: so we don't have to write the same stuff over and over
* lambda expressions: so we can write our own functions
   * what exactly has it meant when informally referring to substitution?
   * compare to traditional functions f(x)
   * functions with multiple arguments
* recursive functions
   * magic letrec
   * if/then/else vs.
   * induction
      * pattern matching
* higher-order functions: ???
   * letrec can be expressed as a function
* natural numbers as functions: ???
   * addition and multiplication, etc. as functions
   * when do I bring in induction? how do I represent *them*?
* non-strictness: ???
   * infinity is now a valid number
      * weird fixpoints of other values
   * eta reduction at some point?
* types: weirdness sneaking into code:
   * wtf is the meaning of the fixpoint of id?
   * wtf does it mean to add a function and a number?

more stuff:
* partiality:
   * defining division: how to define 0/0
      * not a very good example
      * maybe sometimes 0^0 undefined is preferred?
   * fixpoints: incredibly useful, but not always meaningful
   * implement part now, finish later
      * also holes, postulates
   * square root
      * sum types: compare partiality to maybe?
   * can't use maybe if you don't know if the function will return
      * related to ezyang post? maybe is preferred, but not always possible?
* product types: define div and rem at the same time
* sum types:
   * single definition for subtraction of naturals:
      * partial subtraction, i.e. throw an error
      * truncated subtraction, i.e. become zero
      * difference subtraction, i.e. absolute value of the integer result
      * related: two representations of integers? (three including built-in, even more incl. functions, infinite theoretically)

### Outline of Mathematics
This is basically the type theory chapter, but I'm not restricting myself to just TT.
1. Introduce all of the type systems I want, and the things inbetween (this section will probably amount to most of the chapter)
   1. Lambda cube
   2. Effects systems
   3. Linear types
   4. HoTT
2. Computational trinitarianism/quadrinitarianism, "propositions as some types"
   * Basically, describe logic and CT in terms of TT?
   * Comparison to other models like ZFC?
   * "univalent foundations"
   * call/cc = pierce's law
3. Formal verification and writing proofs, basically "intro to doing math with TT"

This section has the benefit of allowing new features, like:
* obviously bug-reducing features and type declarations like GADTs
* value inference
* typed holes
* tactics
* typeclasses, constraint solving
* ad-hoc polymorphism (multiple dispatch?)

Also include other systems like refinement types?

This section will basically be introduced in terms of "what can I get the type checker/inferencer to do for me?"
Types need to be introduced not based on what they *forbid* (or permit, relative to what other type systems forbid), but rather based on what they *allow* you to do.
In particular, this section should be less about "math, but also you get these features", but rather "check out this feature that we used math to get". (e.g.: type inference is logic. types are also logic.)

### Outline of Abstractions
This chapter is largely about category theory, but also the kinds of powerful libraries that you can build in languages like Haskell, e.g.
* recursion schemes
* lenses
* functors, monads, comonads
* honestly I personally don't understand a lot of this stuff. I need to learn more before I can write this chapter.

### Outline of Implementation
* Frontend/syntax
  * Lexers
  * Parsers
* Implementation (code generators and interpreters have in common that they assign semantics to programs):
  * IRs, Virtual machines
  * Interpreters
    * Optimal evaluators, because they're magic
      * but I can only do this if I get into interaction nets and stuff in theory. otherwise that'd be way too much of a distraction for the purposes of this chapter.
      * other variations on reduction/evaluation strategy: lazy, fully lazy, completely lazy, optimal (two more? I forgot the thesis)
  * Compilers
    * JITs
  * Boxed and unboxed types: not relevant to the type theory, but relevant to programmers and implementers for performance
* Compiler targets
  * Real machines
    * The differences between various real machines
    * Weird machines like GPUs
      * maybe even reference quantum computers just for fun, if I manage to present enough theory
  * Not-real machines:
    * VMs like JVM, CLR
    * Backends like LLVM and GCC
  * Platforms
    * Which OS: Windows, OS X, iOS, Android, Linux, *BSD, etc., or none??
      * Portable executable formats
      * Standards like POSIX
    * Embedded systems
* Optimization
  * choosing algorithms: better isn't always better (e.g. compile times vs. ideal outputs)
  * large scale program rewrites
    * Partial evaluation?
  * inlining, loop unrolling, etc.
  * stuff like peephole optimizations
* Output information for debuggers, or is that tooling?
* Runtimes:
  * Garbage collection
  * Task scheduling
  * Management of other resources
* Linkers

Notes:
* Take advantage of formal verification to avoid fuck-ups in complex rewrites in e.g. optimization

### Outline of Design
I wanted design to come *before* implementation, but design can be tightly intertwined with implementation, e.g.
* choosing a syntax that's pragmatic for parsing
* not including features that assume a sufficiently smart compiler
* avoiding trying to design an unimplementable kitchen sink

On the other hand, I'd like to *implement* something that we *designed* earlier on.
* and implementation is basically it's entire own field. design is substantially smaller, something I'm more experienced with, and perhaps something more relevant to this book.
* but I guess it's still intertwined enough that if I do one, I need the other too.

This section is basically about the general wisdom of the programming languages community rather than theory or code.

Anyway, the outline (not really structured enough to be an outline yet):
* what it takes for a general programming language to see uptake
  * a killer framework/app/whatever
* kitchen sinks are bad: focus on one thing and do it well
  * DSLs, configuration languages
    * don't fuck up your configuration language by making it underpowered
  * e.g. linear types are more expressive, but usually you just don't care to reason about that stuff
  * pick what platforms to target (hint: it can't be all of them)
* principle of least astonishment, novelty quota
  * https://futhark-lang.org/blog/2018-06-18-designing-a-programming-language-for-the-desert.html
* concrete syntax doesn't matter, but you should pick something your target audience would be familiar with, wadler's law
  * unless your goal is to be the same language but with better syntax, in which case you're fine
  * don't bikeshed
  * discuss various examples of concrete syntax anyway
    * like what various real language families do
    * mixfix, precedence, custom operators
      * pros/cons of relying heavily on symbols
        * should I support unicode (yes) and should I use it in my core language (maybe)
* pick your power wisely!
  * e.g. kitchen sinks, as referenced before
  * combining features can be hard to reason about
    * broad laziness like in Haskell can make writing performant programs really hard
  * more features can be slower, e.g. applicative is faster than monad
    * or they can restrict what you can model, e.g. there are more applicatives than monad
  * more features can make your PL substantially harder to implement
    * e.g. call/cc... (?)
    * which will force you to make trade-offs re: speed, quality of tooling
* as part of the pragmatic wisdom, link to existing relevant communities!
* design your standard library
* how did Haskell end up with this? https://aphyr.com/posts/342-typing-the-technical-interview
  * “Haskell is a dynamically-typed, interpreted language.” in the type system! the type system is kinda like prolog, but worse
* include *syntactic* features that make life easier without adding any theoretical power to the language, e.g.:
  * pattern matching (and case), pattern synonyms, guards (and multi-way if), where clauses, view patterns, copatterns
  * do macros/fexprs belong here instead?
    * can these other things be implemented with macros in the first place? it seems like that would be the ideal solution.
      * even if macros aren't allowed in the final language, they could still be a useful way to present syntactic features because they're literally just functions on the AST, which is what sugar is anyway, only it's described *within* the language
  * list/monad/sql/whatever comprehensions
  * do/applicative do/fix do/proc syntax
  * rebindable syntax
    * is rebindable syntax just a matter of unhygienic macros?
  * syntax for literals (e.g. list syntax, pair syntax, tuple sections), record puns

Maybe even get into meta-explanation stuff like the monad tutorial fallacy?

### Outline of Tooling
* continuing to parse in the face of errors
  * automatic error correction, even
  * good error messages
* incremental parsing/compilation/etc
* IDEs
  * language servers
  * syntax highlighting
  * structural editors
* literate programming
* build systems
  * package managers
* version control systems
