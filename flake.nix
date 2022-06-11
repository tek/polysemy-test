{
  description = "Polysemy Effects for Testing";

  inputs.hix.url = github:tek/hix;

  outputs = { hix, ... }:
  let

    ghc922 = { hackage, jailbreak, notest, ... }: {
      type-errors = notest;
    };

    all = { hackage, source, ... }: {
      polysemy = hackage "1.6.0.0" "15k51ysrfcbkww1562g8zvrlzymlk2rxhcsz9ipsb0q6h571qgvf";
      incipit-base = hackage "0.3.0.0" "1078yyl5k94c9pr16rqd1i1g1fj8zx4iswhk7rcxb8f10fjqzapg";
      incipit-core = hackage "0.3.0.0" "0q11zmxlpdb72p8c8zvr5hd7qca9c37crm70lm16jxlzw1qxk51b";
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
