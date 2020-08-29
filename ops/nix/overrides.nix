niv:
{
  pkgs,
  hackage,
}:
self: super:
let
  inherit (hackage) cabal2nix subPkg;

  custom = {
    polysemy = cabal2nix "polysemy" niv.polysemy;
    polysemy-plugin = subPkg "polysemy-plugin" "polysemy-plugin" niv.polysemy;
  };
in
  custom
