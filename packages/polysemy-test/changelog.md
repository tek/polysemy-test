# 0.3.1.0

* Add Hedgehog assertion combinators for the difference between numeric values.
* Add `assertEq` / `assertNeq` as prefix synonyms for `(===)` / `(/==)`.

# 0.3.0.0

* Add type parameter for the monad used by `TestT` to `Hedgehog`
* Interpret `Hedgehog` with Polysemy counterparts to `TestT`'s monad stack.
* Add `evalError`, which converts a Polysemy `Error` effect into an assertion.

# 0.1.0.0

* initial release
