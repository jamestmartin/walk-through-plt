# Ideas
These are some ideas I have for things I would like to add to the book.
*This is just brainstorming.* This list isn't sorted, and very little thought has gone into whether any given concept should be included or not.


* lambda calculus
* prescence of bottoms: http://blog.ezyang.com/2010/12/hussling-haskell-types-into-hasse-diagrams/
   * partial functions vs. total functions
* fixpoints
* (co)effect systems
   * monadic IO, uniqueness types
* continuations, delimited continuations
   * relationship to law of excluded middle
* call-by-name, call-by-value, call-by-push-value
   * strictness vs. eagerness
   * laziness
   * might be a good introduction for data vs. codata. infinity related to fixpoints?
* various kinds of normal forms
* untyped lambda calculus "type errors"
* simple, polymorphic, type constructors, dependent types
   * insanely dependent types?
* inductive, coinductive types
   * inductive-recursive, inductive-inductive types
   * mutally recursive types
* linear types (incl. relevant/affine), ordered types
   * classical linear logic
* conservation of information
   * quantum computing
* univalence, higher-inductive types, HoTT
   * and OTOH, axiom K
* identity types
* module systems (that one paper with agda packageinfo?)
* type inference
   * restricting types to those which can be inferred (e.g. HM) vs. allowing imperfect inference (not the most general type)
* value inference
   * automatic typeclass deriving
* type of types, kinds
* type universes, level/universe polymorphism, cumulativity
   * russell vs. tarski universes?
* pattern matching, copatterns
* subtyping
* iso/equirecursive types

* typeclasses
   * contrast to logic programming systems (e.g. prolog), and mercury
   * contrast to similar code written using dependent types?
   * postulates related to nullary type classes?
* monad comprehensions with parallel/sql-like/generalized? applicative do?
   * ideally with some kind of macros!

* strong normalization
* confluence
* referential transparency
* purity
* total functions

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

* macros, fexprs: lisp-like and TH-like?
  * relationship to rebindable syntax. is that like an unhygienic macro, or typeclass?
* tactics
* pattern synonyms
* syntax extensions
* reflection

* process calculi
* separation logic

* strict control over computational/space complexity

* sized types, guardedness?
* reflection
* implicit arguments
* positivity checking

* modality:
  * flat modality??
  * spacial/crisp type theory??
* pure type systems?

late-game:
* category theory
* optimal evaluation
   * lazy, fully lazy, completely lazy, optimal (two more? I forgot the thesis)
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
   * incremental compilers
* language servers
* syntax highlighters
* optimizations
* structural editors
* garbage collection
* build systems
* version control systems
* literate programming


alternative models of computation:
* turing machines
* rewriting systems
* cellular automata
* combinator calculi
   * supercompilation?


every single part comes with
* strong motivating examples for a programmer
* clear, concrete explanations
* formal verification of every statement made
* an executable implementation that you can play with, *right now*
* citations to previous work, useful links
* exercises?
* pronunciation guides
   * input method guides for special characters

the book should be dense, but *self-contained*.


fuck it, let it serve as an introduction to programming *in general*.



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

* values are built of constructors, computations are everything else


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





stuff for the calculator:
* what is an expression, reduction, normal form, joinability, Church-Rosser property
