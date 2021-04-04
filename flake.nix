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
    import ./ops/nix/outputs.nix {
      inherit tryp-hs;
      compiler = "ghc8104";
      overrides = import ./ops/nix/overrides.nix inputs;
    };
}
