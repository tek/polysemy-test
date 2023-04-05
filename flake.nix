{
  description = "Polysemy effects for testing";

  inputs.hix.url = "git+https://git.tryp.io/tek/hix";

  outputs = { hix, ... }: hix.lib.pro {
    ghcVersions = ["ghc810" "ghc90" "ghc92" "ghc94"];
    hackage.versionFile = "ops/version.nix";

    overrides = { hackage, ... }: {
      incipit-base = hackage "0.5.0.0" "02fdppamn00m94xqi4zhm6sl1ndg6lhn24m74w24pq84h44mynl6";
      incipit-core = hackage "0.5.0.0" "1pql8s941jb21kvsx5py4ffnilm1ga136npa25ifsh3l7yapci30";
    };

    envs.dev.overrides = { hackage, ... }: {
      polysemy = hackage "1.9.0.0" "1af07cppnjpv5v56wanya1mhkvbfnyynf5447mnkcf4zc4k23pyk";
      polysemy-plugin = hackage "0.4.4.0" "08ry72bw78fis9iallzw6wsrzxnlmayq2k2yy0j79hpw4sp8knmg";
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
