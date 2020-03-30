# Ideas
These are some ideas I have for things I would like to add to the book.
*This is just brainstorming.* This list isn't sorted, and very little thought has gone into whether any given concept should be included or not.

## Outline
1. programming languages
   * theory naturally progresses into mathematics (and physics?)
   * ??? naturally progresses into linguistics?
      * linguistics and physics are observational, whereas PLT and mathematics are more pure
   * implementation naturally progresses into operating systems
2. CPUs & operating systems
3. networks
4. video games

Reading this book should be a *constant*, but evenly-paced struggle.
It will be difficult to understand, but as soon as you know it, it'll all seem incredibly obvious.

### Programming Languages
--- theory
1. Computation: The precise semantics of various models of computation.
2. Types: The relationship between programs and proofs.
3. Abstractions: Abstractions at a higher level than TT, library design.

--- practice
4. Design: How can I categorize languages? Why should I pick one over any other? DSLs? How do I pick syntax? the pragmatics of programming languages
5. Implementation: Parsers, interpreters, compilers, JITs, virtual machines, runtimes
6. Tooling: IDEs, formatters, package managers (specialized source control, structural editors?), proof assistance?

## ~~Lambda Calculus~~
### ~~What is the lambda calculus?~~
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

### Beyond that...
The computation is more fundamental than the types. Type theory feels seriously overemphasized. *The types are just annotations that get stripped away* (even typeclasses are just implicit parameters, although types *are* necessary to meaningfully infer them).
It doesn't help that I'm trying to build up *computational* ideas. Types *limit* computational ideas. That's the opposite of what I want. I'll add types after I explain the computation.

#### More *computational* ideas
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
* fixpoints
* continuations, delimited continuations
   * relationship to law of excluded middle-- though this part should probably wait until I get to "propositions as some types"
* call-by-name, call-by-value, call-by-push-value
   * strictness vs. eagerness
   * laziness
   * might be a good introduction for data vs. codata. infinity related to fixpoints?
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
   * restricting types to those which can be inferred (e.g. HM) vs. allowing imperfect inference (not the most general type)
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
* monad comprehensions with parallel/sql-like/generalized? applicative do?
   * ideally with some kind of macros!

* tactics
* pattern synonyms
* syntax extensions
* reflection

* separation logic

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
