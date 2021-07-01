{
  description = "Polysemy Effects for Testing";

  inputs = {
    hix.url = github:tek/hix;
    polysemy.url = github:polysemy-research/polysemy;
  };

  outputs = { hix, polysemy, ... }:
  let
    compat901 = { hackage, source, jailbreak, minimal, noHpack, ... }: {
      path = hackage "0.9.0" "14symzl1rszvk5zivv85k79anz7xyl5gaxy0sm4vhhzsgxc59msv";
      path-io = jailbreak (hackage "1.6.3" "05hcxgyf6kkz36mazd0fqwb6mjy2049gx3vh8qq9h93gfjkpp2vc");
      polysemy = noHpack (minimal (source.root polysemy));
      polysemy-plugin = noHpack (minimal (source.sub polysemy "polysemy-plugin"));
      relude = hackage "1.0.0.1" "164p21334c3pyfzs839cv90438naxq9pmpyvy87113mwy51gm6xn";
      type-errors-pretty = jailbreak;
    };

    overrides = { hackage, source, ... }: {
      path = hackage "0.8.0" "0isldidz2gypw2pz399g6rn77x9mppd1mvj5h6ify4pj4mpla0pb";
      polysemy = hackage "1.5.0.0" "1xl472xqdxnp4ysyqnackpfn6wbx03rlgwmy9907bklrh557il6d";
      polysemy-plugin = hackage "0.3.0.0" "1frz0iksmg8bpm7ybnpz9h75hp6hajd20vpdvmi04aspklmr6hj0";
      tasty-hedgehog = hackage "1.1.0.0" "0cs96s7z5csrlwj334v8zl459j5s4ws6gmjh59cv01wwvvrrjwd9";
    };
  in
    hix.flake {
      base = ./.;
      overrides = overrides;
      compatOverrides = { ghc901 = compat901; };
      packages.polysemy-test = "packages/polysemy-test";
      ghci.extraArgs = ["-fplugin=Polysemy.Plugin"];
      versionFile = "ops/hpack/packages/polysemy-test.yaml";
    };
}
