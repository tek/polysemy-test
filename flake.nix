{
  description = "Polysemy Effects for Testing";

  inputs.hix.url = git+https://git.tryp.io/tek/hix;

  outputs = { hix, ... }:
  let

    all = { hackage, ... }: {
      incipit-base = hackage "0.4.0.0" "0g04mw1si70g5kkgz9gnk460d4pvm65i30hd9abrg6g0ryizixqf";
      incipit-core = hackage "0.4.0.0" "168m94c1480y8lhin1sbrwzr14dq13ixkgkcl7ikq78vcq267521";
    };

    dev = { hackage, ... }: {
      polysemy = hackage "1.8.0.0" "0jgaqmcf4l8h58g1y576rrr74sii60mymqxh3ii3clnxcllp3p01";
      polysemy-plugin = hackage "0.4.3.1" "0kjwxal9m3lvri35vliwfwcgcj9fkp50ybv4kbgvsjj8srh0pyfj";
    };

  in hix.lib.pro ({ config, ... }: {
    packages.polysemy-test = ./packages/polysemy-test;
    devGhc.compiler = "ghc902";
    overrides = { inherit dev all; };
    ghci = {
      preludePackage = "incipit-core";
      preludeModule = "IncipitCore";
    };
    hpack.packages.polysemy-test = import ./ops/hpack.nix { inherit config; };
    hackage.versionFile = "ops/version.nix";
  });
}
