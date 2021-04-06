{
  description = "Polysemy effects for testing";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/c0e881852006b132236cbf0301bd1939bb50867e;
    tryp-hs = {
      url = github:tek/tryp-hs;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { tryp-hs, ...}@inputs:
  let
    overrides = { hackage, source, ... }: {
      path = hackage "0.8.0" "0isldidz2gypw2pz399g6rn77x9mppd1mvj5h6ify4pj4mpla0pb";
      tasty-hedgehog = hackage "1.1.0.0" "0cs96s7z5csrlwj334v8zl459j5s4ws6gmjh59cv01wwvvrrjwd9";
      polysemy = hackage "1.5.0.0" "1xl472xqdxnp4ysyqnackpfn6wbx03rlgwmy9907bklrh557il6d";
      polysemy-plugin = hackage "0.3.0.0" "1frz0iksmg8bpm7ybnpz9h75hp6hajd20vpdvmi04aspklmr6hj0";
    };
  in
    tryp-hs.flake {
      base = ./.;
      compiler = "ghc8104";
      main = "polysemy-test";
      overrides = tryp-hs.overrides overrides;
      packages.polysemy-test = "packages/polysemy-test";
      ghci.extraArgs = ["-fplugin=Polysemy.Plugin"];
      ghcid.prelude = "packages/polysemy-test/lib/Prelude.hs";
      versionFile = "ops/hpack/packages/polysemy-test.yaml";
    };
}
