# 0.7.0.0

* Add `unitTestTimes`, converting `UnitTest` to `TestTree` with a specified number of test runs.
* Support GHC 9.4.

# 0.6.0.0

* Expose the `Error Failure` effect in the hedgehog interpret stack to allow throwing `Failure` manually.

# 0.3.1.0

* Add Hedgehog assertion combinators for the difference between numeric values.
* Add `assertEq` / `assertNeq` as prefix synonyms for `(===)` / `(/==)`.

# 0.3.0.0

* Add type parameter for the monad used by `TestT` to `Hedgehog`
* Interpret `Hedgehog` with Polysemy counterparts to `TestT`'s monad stack.
* Add `evalError`, which converts a Polysemy `Error` effect into an assertion.

# 0.1.0.0

* initial release
