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



## Jokes
* a mathematician is a device for turning coffee into theorems
* a comathematician is a device for turning cotheorems into ffee
* every nut is a coconut
* a monad is a monoid in the category of endofunctors

## Examples
univalence: I want to do math on unary numbers, but implement them as faster bitvectors?
