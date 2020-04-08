The short reasons you should care about each thing:
* Purity: It becomes easier to reason about code, both for humans and the compiler.
  * The compiler can rewrite your code in powerful ways without changing what your code does.
    * For example, `map g . map f` can be rewritten to `map (g . f)` (i.e. you can combine the bodies of loops), which would be incorrect if e.g. the first loop's body performs side-effects that affect the second loop.
    * The compiler could *also* take `map g . map f` and turn it into two threads so that `map g` and `map f` run *in parallel*.
      * Or it could perhaps just take `map f` and run every iteration on the loop *simultaneously*, either in batches on CPU threads, or just *all at once* by asking the GPU to do it.
  * This also allows the *programmer* to refactor code more easily. For example, you could split up a complex loop body into two separate functions and know that your code will still work because you didn't break any hidden data/effect dependencies (because `map (f . g) = map f . map g`). (and I haven't even gotten into the kinds of things you can make it do on things other than `map`)
* Effect systems: You get all of the benefits of purity while still being able to write code with side effects almost as conveniently as you would in a pure language (as opposed to monads, which don't compose well and are difficult to use).
* Non-strictness: You can easily write powerful algorithms taking advantage of potentially infinite data structures.



Original things to describe.
* Call-by-push-value: Combine non-strict and strict code in the same language
* Evaluation strategies
* Continuations: Implement algorithms using backtracking without the awkwardness and poor composability of monads (???).
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

More stuff:
* Dynamic typing:
  1. Undefined behavior will terminate the program rather than potentially leading to incorrect program behavior, or possibly even data corruption.
  2. Undefined behavior will fail immediately, making it easier to determine where the error occurred.
  3. Runtime type information can be used to implement dynamic dispatch: a single function may be defined on multiple types.
     * In an untyped language, it is not always possible to distinguish between e.g. an integer and a floating point number, so it is impossible to write a single function that operates on either (without explicit use of a tagged union). On the other hand, with dynamic types, one may use the runtime type information of a value to determine whether to call the implementation for integers or for floating point numbers.
     * A more complicated example would be OOP, where the types themselves contain information about how functions are defined. Dynamic dispatch may involve directly calling a function specified in the type, rather than simply conditionally executing functions based on the type.
       * This may be extended to permit duck typing.
* Static typing:
  1. Undefined behavior can be caught by the compiler before the program even runs.
  2. Many of the kinds of 'ad-hoc' polymorphism supported by dynamic dispatch can be performed at compile time, with static dispatch:
     * A function may be 'overloaded' with different implementations for different types. The compiler can choose the correct implementation to use at compile-time. The programmer does not have to (and in fact, in implementations with type erasure, *can* not) define the behavior of a function by analyzing its type. This is usually more powerful than what you can do with dynamic typing, because in dynamic typing, the programmer (except perhaps in the case of late binding) must define how the function behaves on every type up-front, whereas with static dispatch, the programmer can define implementations with for new types without having to modify how the function is implemented for other types.
     * If type information is still available at runtime, the compiler may verify that a function *is* defined on a type at compile-time, but still choose the specific implementation based on dynamic dispatch. Downcasting is also often supported, although this is a form of mixed static and dynamic typing.
  3. Programmers may express what contracts their functions fulfill, in a way that cannot become inconsistent with the implementation (unlike with documentation), and cannot be incorrect (because it is statically checked by the compiler), which are verified at compile-time (unlike with assertions).
* Parametric polymorphism (parametricity): Like ad-hoc polymorphism, parametric polymorphism allows a function to be defined on multiple types (e.g. on a list of *any* type of values). However, unlike ad-hoc polymorphism, parametric polymorphism is guaranteed to be defined *independently* of the quantified type, a property called "parametricity". An ad-hoc polymorphic 'length' function defined on lists could potentially distinguish between a list of integers and a list of strings, so that the 'length' of a list of integers is their sum, whereas the length of a list of any other type is the list's length. A parametrically polymorphic function is guaranteed not to do that.
* Duck typing
* Static dispatch
* Dynamic dispatch
* Deferred dispatch
* Function overloading

Types have two main purposes:
1. To limit the scope of, or entirely prevent, undefined behavior, and to help diagnose where undefined behavior could possibly occur.
2. To provide information which may be used to implement polymorphism (including polymorphic optimizations).

Type systems may be static, dynamic, or a mix between those options.

Dynamic types have these advantages:
1. Runtime type information may be used to implement features such as dynamic dispatch (which is necessary to support OOP), late binding, downcasting, and reflection.

Static types have these advantages:
1. Static types serve as documentation for the programmer about e.g. the valid inputs and outputs of a function. However, being part of the implementation. they cannot become out-of-sync with the implementation. They document a function's contract in a way that can be checked by the compiler.
2. Static types provide information that the compiler may use for optimizations.
3. Static types may be used to implement features such as static dispatch, function overloading.
4. Undefined behavior may be caught without even needing to run the program.
