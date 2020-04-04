# Linearity
* Linearity: use each value exactly once
* Relevant: use each value at least once
* Affine: use each value at most once
* Ordered: use each value at most once, in order

We are now forced to explicitly track weakning/contraction.
Weakening/contraction may not be defined on every type.
* Explicit modality operators?

This is useful for modelling memory allocation and references like in Rust.
We may also explicitly model our evaluation order with modal operators (?).
