{
  description = "Polysemy Effects for Testing";

  inputs.hix.url = github:tek/hix;

  outputs = { hix, ... }:
  let

    ghc921 = { hackage, jailbreak, ... }: {
      path = hackage "0.9.2" "1dp45vvx7y78lc0cvd0fp1s5vmj85ywi2b6gag67wkfgsd4a4zpz";
      polysemy = hackage "1.7.1.0" "0qwli1kx3hk68hqsgw65mk81bx0djw1wlk17v8ggym7mf3lailyc";
      type-errors = hackage "0.2.0.0" "19km8k3g5gn69vvpq0qi0wzsrcjz5k6kb6qjrccq7za39z9slr2z";
    };

    all = { hackage, source, ... }: {
      polysemy = hackage "1.6.0.0" "15k51ysrfcbkww1562g8zvrlzymlk2rxhcsz9ipsb0q6h571qgvf";
      incipit-base = hackage "0.2.0.0" "12979prkjk1kr1556mwsgf1v04rzd67xg68x6q9pnvm41pxbvk5w";
      incipit-core = hackage "0.2.0.0" "1v4xrqwcylbk32b6hzl6i7k0964varw2iy73s7mkjxpxpdg432ci";
    };

  in hix.lib.flake ({ config, ... }: {
    base = ./.;
    packages.polysemy-test = ./packages/polysemy-test;
    overrides = { inherit all ghc921; };
    ghci.preludePackage = "incipit-core";
    hpack.packages.polysemy-test = import ./ops/hpack.nix { inherit config; };
    hackage.versionFile = "ops/version.nix";
  });
}
