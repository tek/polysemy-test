{
  description = "Polysemy effects for testing";

  inputs.hix.url = "git+https://git.tryp.io/tek/hix";

  outputs = {hix, ...}: hix.lib.pro {
    ghcVersions = ["ghc92" "ghc94" "ghc96"];
    hackage.versionFile = "ops/version.nix";
    gen-overrides.enable = true;

    envs.ghc96.overrides = {hackage, jailbreak, ...}: {
      polysemy = hackage "1.9.1.1" "0hh99vxhf1cyfpzyj6j9s5l2yz7gdp1m10bk98fh2mjqxm207s4k";
      type-errors = jailbreak;
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
