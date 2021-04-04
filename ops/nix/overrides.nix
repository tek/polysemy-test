inputs:
{
  pkgs,
  hackage,
  ...
}:
self: super:
let
  inherit (hackage) pack cabal2nixNoHpack subPkgNoHpack;
  current = [
    (pack "path" "0.8.0" "0isldidz2gypw2pz399g6rn77x9mppd1mvj5h6ify4pj4mpla0pb")
    (pack "tasty-hedgehog" "1.1.0.0" "0cs96s7z5csrlwj334v8zl459j5s4ws6gmjh59cv01wwvvrrjwd9")
    (pack "polysemy" "1.5.0.0" "1xl472xqdxnp4ysyqnackpfn6wbx03rlgwmy9907bklrh557il6d")
    (pack "polysemy-plugin" "0.3.0.0" "1frz0iksmg8bpm7ybnpz9h75hp6hajd20vpdvmi04aspklmr6hj0")
  ];
in
  builtins.listToAttrs current
