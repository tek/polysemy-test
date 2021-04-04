{
  description = "GHC 8104 test flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/c0e881852006b132236cbf0301bd1939bb50867e;
    flake-utils.url = github:numtide/flake-utils;
    tryp-hs.url = github:tek/tryp-hs;
    tryp-hs.inputs.nixpkgs.follows = "nixpkgs";
    polysemy.url = github:polysemy-research/polysemy;
  };

  outputs = inputs:
  let
    system = "x86_64-linux"; 
    project = import ../project.nix { inherit system inputs; compiler = "ghc8104"; };
  in { defaultPackage.${system} = project.ghc.polysemy-test; };
}
