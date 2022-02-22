# About

This package provides utilities for testing [Polysemy] programs:

* An effect, `Test`, that gives access to temporary files and fixtures
* An effect, `Hedgehog`, for lifted [Hedgehog] assertions

# Example

```haskell
import Path (relfile)
import Polysemy.Test
import Test.Tasty (defaultMain)

test_fixture :: UnitTest
test_fixture =
  runTestAuto do
    fixContent1 <- fixtureLines fixRel
    fixPath <- Test.fixturePath fixRel
    fixContent2 <- Text.lines <$> embed (Text.readFile (toFilePath fixPath))
    fixContent1 === fixContent2
    fixContent1 === ["file", "content"]
  where
    fixRel =
      [relfile|files/file1|]

main :: IO ()
main =
  defaultMain (unitTest test_fixture)
```

# Fixtures

Any file that is located below the subdirectory `fixtures` inside the test
directory can be accessed using the constructors `Test.fixturePath`,
`Test.fixture` and `Text.fixtureLines`.

You can override the path used to look for the `fixtures` directory by using
`runTest` instead of `runTestAuto`.
The latter analyzes the call stack to determine the test directory.

# Temp Files

The constructors `Test.tempDir`, `Test.tempFile`, `Test.tempFileContent` and
`Test.tempFileLines` allow you to create and read files in the `temp` directory
within the test directory.

# Paths

All paths are of type `Path` from the package [path].

You can construct them using the quasiquoters `reldir`, `absdir` etc. or the
functions `parseRelDir`, `parseAbsDir` etc.

[Polysemy]: https://hackage.haskell.org/package/polysemy
[Hedgehog]: https://hackage.haskell.org/package/hedgehog
[path]: https://hackage.haskell.org/package/path
