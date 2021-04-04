{
  description = "Polysemy effects for testing";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/c0e881852006b132236cbf0301bd1939bb50867e;
    flake-utils.url = github:numtide/flake-utils;
    tryp-hs.url = github:tek/tryp-hs;
    tryp-hs.inputs.nixpkgs.follows = "nixpkgs";
    polysemy.url = github:polysemy-research/polysemy;
  };

  outputs = { self, nixpkgs, tryp-hs, flake-utils, ... }@inputs:
  flake-utils.lib.eachSystem ["x86_64-linux"] (system:
    let
      project = tryp-hs.project {
        inherit system;
        base = ./.;
        compiler = "ghc8104";
        overrides = import ./ops/nix/overrides.nix inputs;
        packages.polysemy-test = "packages/polysemy-test";
        ghci.extraArgs = ["-fplugin=Polysemy.Plugin"];
        ghcid.prelude = "packages/polysemy-test/lib/Prelude.hs";
        ghcid.system-hls = true;
        packageDir = "packages";
      };
    in {
      defaultPackage = project.ghc.polysemy-test;
      devShell = project.ghcid-flake.shell;
      legacyPackages = {
        pkgs = project.pkgs;
        ghc = project.ghc;
        ghcid = project.ghcid-flake;
        run = project.ghcid-flake.run;
        shell = project.ghcid-flake.shell;
        cabal = project.cabal;
        tags = project.tags.projectTags;
        hpack = project.hpack-script {};
      };
      packages = {
        polysemy-time = project.ghc.polysemy-test;
        release = project.cabal.release "polysemy-test";
      };
      checks = {
        polysemy-time = project.ghc.polysemy-test;
      };
    }
  );
}
