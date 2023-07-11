{
  description = "Polysemy effects for testing";

  inputs.hix.url = "git+https://git.tryp.io/tek/hix";

  outputs = { hix, ... }: hix.lib.pro {
    ghcVersions = ["ghc810" "ghc90" "ghc92" "ghc94"];
    hackage.versionFile = "ops/version.nix";

    overrides = { hackage, ... }: {
      incipit-base = hackage "0.5.1.0" "0hkqnqpdw8rvg4xzslw9sp3684ggyk9n4hr0lczwm8b0pzakzs0l";
      incipit-core = hackage "0.5.1.0" "04lyzycvqxyjqcd703cd33lnlk5va9wj3czpsybah0ybydnrwabd";
    };

    envs.dev.overrides = { hackage, ... }: {
      polysemy = hackage "1.9.1.0" "05mhzjz6hz0dnxsn3cc0l6yyj5ch35gn8xfnx0a1gn3q8yljfg2a";
      polysemy-plugin = hackage "0.4.5.0" "0v2k0l42zaangwv050xfv5jdqfrbvdxfr533291ndsxalv8n3xi8";
    };

    packages.polysemy-test = {
      src = ./packages/polysemy-test;

      cabal = {
        license = "BSD-2-Clause-Patent";
        license-file = "LICENSE";
        author = "Torsten Schmits";
        prelude = {
          enable = true;
          package = {
            name = "incipit-core";
            version = ">= 0.4 && < 0.6";
          };
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
          "hedgehog >= 1.0.2"
          "path >= 0.7"
          "path-io >= 0.2"
          "polysemy >= 1.3"
          "tasty >= 1.1"
          "tasty-hedgehog >= 1.0.0.2"
          "transformers"
        ];
      };

      test = {
        enable = true;
        dependencies = [
          "hedgehog >= 1.0.2"
          "path >= 0.7"
          "polysemy >= 1.3"
          "tasty >= 1.1"
        ];
      };

    };
  };
}
