The short reasons you should care about each thing:
* Purity: It becomes easier to reason about code, both for humans and the compiler.
  * The compiler can rewrite your code in powerful ways without changing what your code does.
    * For example, `map g . map f` can be rewritten to `map (g . f)` (i.e. you can combine the bodies of loops), which would be incorrect if e.g. the first loop's body performs side-effects that affect the second loop.
    * The compiler could *also* take `map g . map f` and turn it into two threads so that `map g` and `map f` run *in parallel*.
      * Or it could perhaps just take `map f` and run every iteration on the loop *simultaneously*, either in batches on CPU threads, or just *all at once* by asking the GPU to do it.
  * This also allows the *programmer* to refactor code more easily. For example, you could split up a complex loop body into two separate functions and know that your code will still work because you didn't break any hidden data/effect dependencies (because `map (f . g) = map f . map g`). (and I haven't even gotten into the kinds of things you can make it do on things other than `map`)
* Effect systems: You get all of the benefits of purity while still being able to write code with side effects almost as conveniently as you would in a pure language (as opposed to monads, which don't compose well and are difficult to use).
* Non-strictness: You can easily write powerful algorithms taking advantage of potentially infinite data structures.



* Call-by-push-value: Combine non-strict and strict code in the same language

* Evaluation strategies
* Continuations
* Fexprs, macros
* Linear types
  * Uniqueness types
  * Affine types
  * Preservation of information
* Propositions as some types
* Curry-howard correspondence
* Type constructors: The ability to write a type which may take other types as parameters, e.g. instead of writing a separate type for `list of int` and `list of bool` you can write a single type, `for all A, list of A`.
* Polymorphism: The ability to write a single function that operates on multiple types. This is especially powerful when combined when type constructors, when you can define e.g. a length function that operates on a list containing values of *any* type.
  * Parametric polymorphism: Parametricity implies that a function not only *works* on any type, but that it works *independently* of that type. If you say `length : forall a. List a -> Nat`, you know that it only operates on the structure of the list (sorry for this vague term) and ignores the values (e.g. you know that it won't be the length of the list on most types, but be the sum of a list of ints).
  * Ad-hoc polymorphism:
* System F
* Hindley-Milner: A type system which admits most reasonable code and requires no additional work on the part of the programmer aside from 
* Dependent types
* Higher-order functions
* Univalence
* Category theory
* Optimal evaluation
