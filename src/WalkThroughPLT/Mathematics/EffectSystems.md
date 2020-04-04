# Effect Systems
Effect systems are an extension of type systems which additionally model effects.
They require marking functions with the kinds of side-effects they may have.

They allow us to recover something similar to purity as it was described in the original 'Effects' section.

In particular, effectful statements may affect other effectful statements, but only those which somehow depend on it. 
If two effectful statements may be resequenced with no effects, then I call them copure.
* effectful statements and pure statements are copure
* effectful statements are copure to each other if they do not affect the same data, e.g. a mutable local variable write and a file read of a file which is independent of that variable are relatively pure
* effectful statements are copure in this case: reading a mutable variable may pass over any other statement, except for those which write that variable
  * would this be considered an instance of co-effects?
* and in this case: a mutable variable is written once, and then again. the first time the variable is written may be ignored and treated as though it is a pure function assuming the variable is not read between when it is written each time, and there's no multithreaded "volatile" shennanigans going on.
* effectful statements may swap if they are idempotent (and all but the last one may be deleted)
* effectful statements may be swapped if they are commutative (e.g. incrementing a variable without reading it), and possibly combined.
