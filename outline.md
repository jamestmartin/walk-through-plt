# Outline
## After this book, how would I follow up?
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
There are two halves: theory (PLT), and practice (PLD, implementation, pragmatics of PLs).
The first three chapters are theory; the next three are practice.
(Which is not to say the theory lacks practical value; or that the practice of making a PL project is relevant to everyday programmers. If anything, it's the reverse, except for that perhaps making a PL project could potentially be a great example of the ideas I had in the theory book being applied in (some sort of) practice).
1. Computation: The precise semantics of various models of computation.
2. Mathematics: The relationship between programs and proofs. With a special focus on type theory and how type systems are valuable to programmers even when not considering propositions as some types.
3. Abstractions: Abstractions at a higher level than TT, library design. Stuff like category theory, and the ridiculously powerful functional programmer's toolbox, with things like recursion schemes and lenses.
5. Implementation: Parsers, interpreters, compilers, JITs, virtual machines, runtimes, etc.
4. Design: How can I categorize languages? Why should I pick one over any other? DSLs? How do I pick syntax? the pragmatics of programming languages
6. Tooling: IDEs, formatters, package managers (specialized source control, structural editors?), proof assistance?

### Outline of Computation

#### Outline of Lambda Calculus???
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

### Outline of Mathematics

### Outline of Abstractions

### Outline of Implementation
* Frontend/syntax
  * Lexers
  * Parsers
* Implementation (code generators and interpreters have in common that they assign semantics to programs):
  * IRs, Virtual machines
  * Interpreters
    * Optimal evaluators, because they're magic
      * but I can only do this if I get into interaction nets and stuff in theory. otherwise that'd be way too much of a distraction for the purposes of this chapter.
  * Compilers
    * JITs
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

Maybe even get into meta-explanation stuff like the monad tutorial fallacy?

### Outline of Tooling
