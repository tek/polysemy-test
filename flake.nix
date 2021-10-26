{
  description = "Polysemy Effects for Testing";

  inputs.hix.url = github:tek/hix;

  outputs = { hix, ... }:
  let
    compat901 = { hackage, source, jailbreak, minimal, noHpack, ... }: {
      path = hackage "0.9.0" "14symzl1rszvk5zivv85k79anz7xyl5gaxy0sm4vhhzsgxc59msv";
      path-io = jailbreak (hackage "1.6.3" "05hcxgyf6kkz36mazd0fqwb6mjy2049gx3vh8qq9h93gfjkpp2vc");
      relude = hackage "1.0.0.1" "164p21334c3pyfzs839cv90438naxq9pmpyvy87113mwy51gm6xn";
      type-errors-pretty = jailbreak;
    };

    common = { hackage, ... }: {
      polysemy = hackage "1.6.0.0" "15k51ysrfcbkww1562g8zvrlzymlk2rxhcsz9ipsb0q6h571qgvf";
    };

    overrides = { hackage, source, ... }: {
      path = hackage "0.8.0" "0isldidz2gypw2pz399g6rn77x9mppd1mvj5h6ify4pj4mpla0pb";
      tasty-hedgehog = hackage "1.1.0.0" "0cs96s7z5csrlwj334v8zl459j5s4ws6gmjh59cv01wwvvrrjwd9";
    };
  in
    hix.flake {
      base = ./.;
      overrides = [common overrides];
      compatOverrides = { ghc8107 = [common]; ghc901 = [common compat901]; };
      packages.polysemy-test = "packages/polysemy-test";
      versionFile = "ops/hpack/packages/polysemy-test.yaml";
      ghcid.easy-hls = false;
    };
}
