{
  description = "Polysemy effects for testing";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/c0e881852006b132236cbf0301bd1939bb50867e;
    flake-utils.url = github:numtide/flake-utils;
    tryp-hs.url = github:tek/tryp-hs;
    tryp-hs.inputs.nixpkgs.follows = "nixpkgs";
    polysemy.url = github:polysemy-research/polysemy;
  };

  outputs = { tryp-hs, ...}@inputs:
    tryp-hs.flake {
      base = ./.;
      compiler = "ghc8104";
      main = "polysemy-test";
      overrides = import ./ops/nix/overrides.nix inputs;
      packages.polysemy-test = "packages/polysemy-test";
      ghci.extraArgs = ["-fplugin=Polysemy.Plugin"];
      ghcid.prelude = "packages/polysemy-test/lib/Prelude.hs";
      packageDir = "packages";
    };
}
