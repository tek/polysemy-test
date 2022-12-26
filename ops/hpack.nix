{ config, ... }:
let

  paths.when = {
    condition = false;
    generated-other-modules = ["Paths_polysemy_test"];
  };

  base = {
    name = "base";
    version = ">= 4.12 && < 5";
    mixin = "hiding (Prelude)";
  };

  commonDeps = [
    base
    "hedgehog >= 1.0.2"
    { name = "incipit-core"; version = ">= 0.4"; mixin = ["(IncipitCore as Prelude)" "hiding (IncipitCore)"]; }
    "path >= 0.7"
    "polysemy >= 1.3"
    "tasty >= 1.1"
  ];

in {
  name = "polysemy-test";
  synopsis = "Polysemy Effects for Testing";
  version = import ./version.nix;
  github = "tek/polysemy-test";
  description = "See https://hackage.haskell.org/package/polysemy-test/docs/Polysemy-Test.html";
  license = "BSD-2-Clause-Patent";
  license-file = "LICENSE";
  author = "Torsten Schmits";
  maintainer = "hackage@tryp.io";
  copyright = "2022 Torsten Schmits";
  category = "Test";
  build-type = "Simple";
  extra-source-files = ["readme.md" "changelog.md"];
  data-files = ["test/fixtures/**/*"];

  library = paths // {
    source-dirs = "lib";
    dependencies = commonDeps ++ [
      "path-io >= 0.2"
      "tasty-hedgehog >= 1.0.0.2"
      "transformers"
    ];
  };

  tests.polysemy-test-unit = paths // {
    main = "Main.hs";
    source-dirs = "test";
    ghc-options = ["-threaded" "-rtsopts" "-with-rtsopts=-N"];
    dependencies = commonDeps ++ ["polysemy-test"];
  };

  ghc-options = ["-Wall" "-Wredundant-constraints" "-Wunused-packages"];

  default-extensions = config.ghci.extensions;
}
