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
      incipit-base = hackage "0.1.0.0" "0pw3wr3yjwg4zphndnzazb7ycmjmrfqn57sjlkiqlb4hnwxk1xmk";
      incipit-core = hackage "0.1.0.0" "1sx3zqqa95w9zqgmm7jxq9b9slqyysixbi7wz4fyldcx6iidz0pc";
    };

  in hix.lib.flake {
    base = ./.;
    packages.polysemy-test = ./packages/polysemy-test;
    overrides = { inherit all ghc921; };
    compat.projects = {
      "921" = {};
      "902" = {};
      "8107" = {};
      "884" = {};
    };
    hackage.versionFile = "ops/hpack/packages/polysemy-test.yaml";
  };
}
