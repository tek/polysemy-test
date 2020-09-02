{
  base,
}:
let
  niv = import "${toString base}/nix/sources.nix";
  nixpkgsSrc = niv.nixpkgs;
  # hsSrc = ../../../../nix/tryp-hs;
  hsSrc = niv.tryp-hs;

  nixpkgs = import nixpkgsSrc;
  hs = import hsSrc { inherit base; };

  packages = {
    polysemy-test = base + /packages/polysemy-test;
  };

  project = hs.project {
    inherit nixpkgs packages base;
    compiler = "ghc884";
    cabal2nixOptions = "";
    overrides = import ./overrides.nix niv;
    ghciArgs = ["-hide-package" "base" "-Wall" "-Werror"];
    options_ghc = "-fplugin=Polysemy.Plugin";
    packageDir = "packages";
  };
in
  project
