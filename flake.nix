{
  description = "Polysemy Effects for Testing";

  inputs.hix.url = github:tek/hix;
  inputs.incipit-core.url = github:tek/incipit-core?ref=release/0.3;

  outputs = { hix, incipit-core, ... }:
  let

    ghc922 = { hackage, jailbreak, notest, ... }: {
      type-errors = notest;
    };

    all = { hackage, source, ... }: {
      polysemy = hackage "1.6.0.0" "15k51ysrfcbkww1562g8zvrlzymlk2rxhcsz9ipsb0q6h571qgvf";
      incipit-base = source.package incipit-core "incipit-base";
      incipit-core = source.package incipit-core "incipit-core";
      # incipit-base = hackage "0.2.0.0" "12979prkjk1kr1556mwsgf1v04rzd67xg68x6q9pnvm41pxbvk5w";
      # incipit-core = hackage "0.2.0.0" "1v4xrqwcylbk32b6hzl6i7k0964varw2iy73s7mkjxpxpdg432ci";
    };

  in hix.lib.flake ({ config, ... }: {
    base = ./.;
    packages.polysemy-test = ./packages/polysemy-test;
    overrides = { inherit all ghc922; };
    ghci = {
      preludePackage = "incipit-core";
      preludeModule = "IncipitCore";
    };
    hpack.packages.polysemy-test = import ./ops/hpack.nix { inherit config; };
    hackage.versionFile = "ops/version.nix";
  });
}
