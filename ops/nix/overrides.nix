niv:
{
  pkgs,
  hackage,
}:
self: super:
let
  inherit (hackage) pack cabal2nixNoHpack subPkgNoHpack;
  testLower = false;

  lower = [
    (pack "ansi-terminal" "0.10.3" "1aa8lh7pl054kz7i59iym49s8w473nhdqgc3pq16cp5v4358hw5k")
    (pack "ghc-tcplugins-extra" "0.3.2" "04yx676wvb52crrr7bqpld5wrk1n0mfh0zpplnw5qdp8nxxqhn48")
    (pack "path" "0.8.0" "0isldidz2gypw2pz399g6rn77x9mppd1mvj5h6ify4pj4mpla0pb")
    (pack "path-io" "0.2.0" "0nzjkdng60k6r6ph1d6kjkrnlw1029i0y5qaipxr2kvd3sn229ql")
    (pack "pretty-show" "1.9.5" "1iid72ww3bi6r8c8ccln74ddjwz2bz59kz07mvf35wrwmwyrg22b")
    (pack "tasty-hedgehog" "1.1.0.0" "0cs96s7z5csrlwj334v8zl459j5s4ws6gmjh59cv01wwvvrrjwd9")
    (pack "hedgehog" "1.0.2" "0fy2p3qgs6kg7gksm0n4f9adkm6rin5wgl534zzx51hp0q0xh0hr")
    (pack "polysemy" "1.4.0.0" "04bl0w7z35jh63jpy87sa1rrbgqhwn7c0pxsm5l3ww0pjnswkhjj")
    (pack "polysemy-plugin" "0.2.5.0" "0jnps8kwxd0hakis5ph77r45mv1qnkxdf5506shcjb1zmxqmxpjv")
  ];

  upper = [
    (pack "path" "0.8.0" "0isldidz2gypw2pz399g6rn77x9mppd1mvj5h6ify4pj4mpla0pb")
    (pack "path-io" "1.6.2" "1s7cahx8cf85kwz9l8cm6x6kvjwsv0spwv78pybsspb1ap5q287p")
    (pack "tasty-hedgehog" "1.1.0.0" "0cs96s7z5csrlwj334v8zl459j5s4ws6gmjh59cv01wwvvrrjwd9")
    (pack "hedgehog" "1.0.5" "11dcsdrmy18agzb15ay8p933axjwznc0m1pz3a5fs8i852yp6z9z")
    (pack "polysemy" "1.5.0.0" "1xl472xqdxnp4ysyqnackpfn6wbx03rlgwmy9907bklrh557il6d")
    (pack "polysemy-plugin" "0.3.0.0" "1frz0iksmg8bpm7ybnpz9h75hp6hajd20vpdvmi04aspklmr6hj0")
  ];
  versionOverrides = builtins.listToAttrs (if testLower then lower else upper);
in
  versionOverrides
