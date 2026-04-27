{
  description = "Polysemy effects for testing";

  inputs.hix.url = "git+https://git.tryp.io/tek/hix";

  outputs = {hix, ...}: hix.lib.pro {
    ghcVersions = ["ghc96" "ghc98" "ghc910" "ghc912"];
    gen-overrides.enable = true;

    packages.polysemy-test = {
      src = ./packages/polysemy-test;

      cabal = {
        license = "BSD-2-Clause-Patent";
        license-file = "LICENSE";
        author = "Torsten Schmits";
        prelude = {
          enable = true;
          package = "incipit-core";
          module = "IncipitCore";
        };
        language = "GHC2021";
        meta = {
          synopsis = "Polysemy effects for testing";
          maintainer = "hackage@tryp.io";
          category = "Test";
          github = "tek/polysemy-test";
          data-files = ["test/fixtures/**/*"];
          extra-source-files = ["readme.md" "changelog.md"];
        };
      };

      library = {
        enable = true;
        dependencies = [
          "hedgehog"
          "path"
          "path-io"
          "polysemy"
          "tasty"
          "tasty-hedgehog"
          "transformers"
        ];
      };

      test = {
        enable = true;
        dependencies = [
          "hedgehog"
          "path"
          "polysemy"
          "tasty"
        ];
      };

    };

    managed = {
      enable = true;
      lower.enable = true;
      latest.compiler = "ghc912";
      lower.compiler = "ghc94";
    };

    hackage.repos."hackage.haskell.org".user = "tek";

    internal.hixCli.dev = true;

  };
}
