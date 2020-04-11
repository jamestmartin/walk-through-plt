# Ideas
These are some ideas I have for things I would like to add to the book.
*This is just brainstorming.* This list isn't sorted, and very little thought has gone into whether any given concept should be included or not.

Reading this book should be a *constant*, but evenly-paced struggle.
It will be difficult to understand, but as soon as you know it, it'll all seem incredibly obvious.

## More *computational* ideas
* records, enums
* recursion, mutual recursion
   * induction and co-induction? structural recursion? is this relevant yet?
* effects
   * these break substitution, so the return value (data) and the effects (computation) are separate
* prescence of bottoms: http://blog.ezyang.com/2010/12/hussling-haskell-types-into-hasse-diagrams/
   * partial functions vs. total functions
   * types: infinite loops, untyped lambda calculus "type errors"
     * Would this be a good introduction to the idea of types? it removes bottoms?
     * Are there other types? IIRC there's some kind of type theory paradox that doesn't even need recursion.
   * stuff like this allows functional programmers to understand not only total functions, but partial functions
* fixpoints
* continuations, delimited continuations
   * relationship to law of excluded middle-- though this part should probably wait until I get to "propositions as some types"
   * https://blog.paralleluniverse.co/2015/08/07/scoped-continuations/
* call-by-name, call-by-value, call-by-push-value
   * strictness vs. eagerness
   * laziness
   * might be a good introduction for data vs. codata. infinity related to fixpoints?
   * laziness semantics (e.g. optimal is better than lazy is better than strict)
* various kinds of normal forms
* linear terms
  * information-conserving terms
  * ordered terms
  * interaction nets
  * relationship to process calculi? (and the idea of process calculi in general)
* combinators
   * as a model of computation?
   * speaking of which, will I ever involve turing machines?
* the computational meaning of univalence?
   * I don't think this makes sense without types. How else would the interpreter know where to substitute?
* modules systems (that one paper with agda packageinfo?)

* strong normalization
* confluence
* referential transparency
* purity
* total functions

* macros, fexprs: lisp-like and TH-like?
  * relationship to rebindable syntax. is that like an unhygienic macro, or typeclass?

## Types
* simple, polymorphic, type constructors, dependent types
   * insanely dependent types?
* inductive, coinductive types
   * inductive-recursive, inductive-inductive types
   * mutally recursive types
* linear types (incl. relevant/affine), ordered types
   * classical linear logic
* type inference
   * restricting types to those which can be inferred (e.g. HM) vs. allowing imperfect inference (not the most general type or failing)
* value inference
   * automatic typeclass deriving
* univalence, higher-inductive types, HoTT
   * and OTOH, axiom K
* type of types, kinds
* type universes, level/universe polymorphism, cumulativity
   * russell vs. tarski universes?
* pattern matching, copatterns
* subtyping
* iso/equirecursive types
* identity types

* impredicativity?
* higher-rank types?
* intermediates between haskell types and dependent types
* comparison to refinement types, contracts?

* irrelevance
* runtime irrelevance
* type irrelevance
* propositions vs. set
* static vs. dynamic, explicit vs. implicit
* axioms

* strict control over computational/space complexity

* sized types, guardedness?
* reflection
* implicit arguments
* positivity checking

* modality:
  * flat modality??
  * spacial/crisp type theory??
* pure type systems?

* security enforced in the type system
* the stuff that jon's working on?

## Unorganized
* (co)effect systems
   * monadic IO, uniqueness types
* conservation of information
   * quantum computing
* typeclasses
   * contrast to logic programming systems (e.g. prolog), and mercury
   * contrast to similar code written using dependent types?
   * postulates related to nullary type classes?
   * relationship to implicit parameters

* tactics
* syntax extensions
* reflection

* separation logic

late-game:
* proof nets?


* operational, denotational, categorical semantics
* small-step vs. large-step, reduction vs. evaluation



interesting, i.e. non-syntactical, Haskell extensions (not e.g. explicitforall, kindsignatures, overloadedsyntax, typeoperators):
* unboxed types
* DataKinds, PolyKinds, ConstraintKinds
* quantifiedconstraints
* TemplateHaskell (strictly speaking, this is syntactic I guess)
* Typable, Generic?, Lift?
* multiparamtypeclasses
* overlapping instance pragmas, undecidable instances
* existential types/rank 2 types/rank n types
* impredicative polymorphism

* bangpatterns/strictdata (only interesting in some data types)

* not actually in haskell yet, but open data types

interesting syntax extensions:
* partial type signatures
* typed holes
* rebindable syntax
* the various list comprehension syntax things
* the various do notation syntax things: e.g. ApplicativeDo, RecursiveDo
* view patterns
* pattern synonyms (esp. the fancy versions)
* arrow notation / proc
* multiwayif
* namedfieldpuns, namedwildcards
* NumericUnderscores



ideal: e.g. adding functions, making a type more polymorphic, adding features, should never break new code


part 2:
* parsers
   * different kinds of parsing algorithms
   * parsing in the face of errors
   * good error messages
   * incremental parsing
* compilers, formally verified


alternative models of computation:
* turing machines
* rewriting systems
* cellular automata
* combinator calculi
   * supercompilation?


* contravariance is considered kinda weird in pure languages, but is essential to mutability


* forth and scheme have a critical value in common: they both value *compositionality*.
   * in scheme, this is because of the very definition of functions
   * in forth, this is by *necessity*. composition is the most primitive operation. functions *must* be written so that they compose well.



side projects
* scheme, but better
* haskell, but better
* agda, but better
* rust, but worse?
* c, but worse?
* *assembly*, but worse??
* liquid haskell, but worse
* smalltalk, but worse
* forth, but better
* prolog, but better
* mercury, but worse
* constraint vs. logic

* ZFC, but better
* *true* category theory?
* formal logic

* compile to GPU


extend to:
* algorithms
* runtimes
* operating systems
* CPUs
* networks
* cryptography
* quantum computers
* graphics


* mathematics
* physics
* linguistics







notes:
* data is formed exclusively from contructors
* computations are formed from everything else
* a type error is a closed term which is not data but cannot be evaluated further


### Design Ideas
meta:
* understand the time investment involved
* know what the specific purpose of your language is
  * fun, education, etc, are all perfectly good reasons to make a language
  * "general purpose" is not a good purpose. You must know, concretely, how your language will be better than previous languages, and 
* make sure no-one else is already doing what you're doing (this doesn't apply to people making a language for fun/education/etc)
  * if you're making "a better C"
* have a process which is open to contribution
* why your toolchain should be free software (or at the very least open source):
  * otherwise, if you stop maintaining your project, people will have to re-write their projects in another language

design per se:
* limit on newness (futhark desert)
* forwards-compatibility and locality
  * changing code in one place should not break code elsewhere
  * adding new features should not break downstream code (e.g. that one chalk article on modalities)
  * certain kinds of warnings plus `-Werror` can break this
* limit on breaking changes
  * time should be spent on writing new code, not upgrading old code to the new version of the language
  * early on (0.X.Y.Z) more is okay, but prevents adoption
  * after adoption (X.Y.Z), breaking changes prevent upgrade
    * even with minor changes: see Python 3 vs Python 2
    * giving up support for old versions too quickly may cause people to quit using your language
  * allow a gradual transition (like `import __future__`)
    * allows incremental bugfixes and testing
    * reduces the need to commit a ton of time to it
  * you don't want to get caught with tons of backwards-compatibility stuff to support either
* limit on changes, generally
  * people want to *know* their language, so churn can be bad
  * skills shouldn't go out of date too quickly: idiomatic code ideally will stay idiomatic
  * this is mostly a social limitation rather than a technical one, assuming backwards-compatibility, but it's something to keep in mind

specific things to avoid:
* silent failures
* undefined behavior (... should probably cause errors in debug mode. I like what C3 does here, although generally I'd prefer none at all.)

### Tooling Ideas
* it's common to write your compiler in your own language, but a bootstrap compiler/interpreter allows easily re-compiling your language
  * surprisingly rarely necessary, unless you lose all copies of your compiler binary somehow (which would be very bad!)
  * also allows more trust (that infamous trick where a compiler contains malware which it automatically inserts into new compiler builds)
  * the bootstrap compiler doesn't have to be *good*, fast, or whatever. You can just build your "real" compiler, then build your real compiler with itself (and get all of the optimizations).

#### Build related
* reproducible builds
  * bit-for-bit reproducibility is the ideal
    * ability to confirm that a binary hasn't been tampered with by re-building it yourself
  * you want to avoid cases of 'it works on *my* machine'
    * e.g. with C, the mess of dependencies on system libs
  * reproducible across: time, OS, architecture, installed packages
  * not reproducible across: different dependency versions (unless they're dynamically linked, in which case maybe?), compiler versions, compiler options
    * package locks
    * compiler options like `-march=native` should be translatable into something that *is* reproducible
* cross-compilation
* semantic versioning
  * *enforce* semantic versioning by the package repository (I don't think I've seen this done in practice, but it ought to be possible in theory)
* dependency hell
  * supporting multiple versions of a package simultaneously?
* discourage packages like left-pad
  * in practice, it's impossible to verify every package you depend on. You must trust every package you depend on, transitively. The fewer people you implicitly trust, the better.
    * packages can be taken down (like left-pad), or worse, malware or deliberate bugs can be written into them
  * only importing the necessary parts of packages to the binary (this isn't a very common feature in real life, but it's something to think about)
    * ideally only even *compiling* the necessary parts of a package

## Jokes
* a mathematician is a device for turning coffee into theorems
* a comathematician is a device for turning cotheorems into ffee
* every nut is a coconut
* a monad is a monoid in the category of endofunctors

## Examples
univalence: I want to do math on unary numbers, but implement them as faster bitvectors?
