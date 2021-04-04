{
  description = "GHC 865 test flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/cfed29bfcb28259376713005d176a6f82951014a;
    flake-utils.url = github:numtide/flake-utils;
    tryp-hs.url = github:tek/tryp-hs;
    tryp-hs.inputs.nixpkgs.follows = "nixpkgs";
    polysemy.url = github:polysemy-research/polysemy;
  };

  outputs = { tryp-hs, ... }: import ../outputs.nix { inherit tryp-hs; compiler = "ghc865"; };
}
