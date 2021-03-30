niv:
{
  pkgs,
  hackage,
}:
self: super:
let
  inherit (hackage) pack cabal2nixNoHpack subPkgNoHpack;

  versions = [
    # (pack "path" "0.8.0" "0isldidz2gypw2pz399g6rn77x9mppd1mvj5h6ify4pj4mpla0pb")
    # (pack "path-io" "0.3.1" "07m7q36pdkqk18bmf0lkafjc9npksym7dhn2am1m9c1rvj3b26qf")
  ];
  versionOverrides = builtins.listToAttrs versions;

  custom = {
    polysemy = cabal2nixNoHpack "polysemy" niv.polysemy;
    polysemy-plugin = subPkgNoHpack "polysemy-plugin" "polysemy-plugin" niv.polysemy;
  };
in
  versionOverrides // custom
