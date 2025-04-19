{
  description = "Polysemy effects for testing";

  inputs.hix.url = "git+https://git.tryp.io/tek/hix";

  outputs = {hix, ...}: hix.lib.pro {
    ghcVersions = ["ghc92" "ghc94" "ghc96" "ghc98" "ghc910"];
    hackage.versionFile = "ops/version.nix";
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
      latest.compiler = "ghc910";
    };

    envs.ghc910.overrides = {hackage, jailbreak, ...}: {
      incipit-base = hackage "0.6.1.0" "0iyyvxpyyybn5ygr875pav6g5hbs00wa9jbr7qslszqpkfpy5x33";
      incipit-core = hackage "0.6.1.0" "144c239nxl8zi2ik3ycic3901gxn8rccij3g609n2zgnn3b6zilj";
    };

  };
}
