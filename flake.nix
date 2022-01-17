{
  description = "Polysemy Effects for Testing";

  inputs.hix.url = github:tek/hix;

  outputs = { hix, ... }:
  let
    compat902 = { hackage, jailbreak, ... }: {
      polysemy = hackage "1.6.0.0" "15k51ysrfcbkww1562g8zvrlzymlk2rxhcsz9ipsb0q6h571qgvf";
      relude = hackage "1.0.0.1" "164p21334c3pyfzs839cv90438naxq9pmpyvy87113mwy51gm6xn";
    };
  in hix.flake {
    base = ./.;
    overrides = { ghc902 = compat902; };
    packages.polysemy-test = ./packages/polysemy-test;
    versionFile = "ops/hpack/packages/polysemy-test.yaml";
  };
}
