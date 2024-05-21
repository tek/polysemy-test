{
  description = "Polysemy effects for testing";

  inputs.hix.url = "git+https://git.tryp.io/tek/hix";

  outputs = {hix, ...}: hix.lib.pro {
    ghcVersions = ["ghc92" "ghc94" "ghc96" "ghc98"];
    compat.versions = ["ghc94" "ghc96"];
    hackage.versionFile = "ops/version.nix";
    gen-overrides.enable = true;
    managed = {
      enable = true;
      lower.enable = true;
      latest.compiler = "ghc98";
    };

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
  };
}
