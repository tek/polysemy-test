{
  description = "Polysemy Effects for Testing";

  inputs = {
    hix.url = "git+https://git.tryp.io/tek/hix";
    hls.url = "github:haskell/haskell-language-server?ref=1.9.0.0";
  };

  outputs = { hix, hls, ... }:
  let

    all = { hackage, ... }: {
      incipit-base = hackage "0.5.0.0" "02fdppamn00m94xqi4zhm6sl1ndg6lhn24m74w24pq84h44mynl6";
      incipit-core = hackage "0.5.0.0" "1pql8s941jb21kvsx5py4ffnilm1ga136npa25ifsh3l7yapci30";
    };

    dev = { hackage, ... }: {
      polysemy = hackage "1.9.0.0" "1af07cppnjpv5v56wanya1mhkvbfnyynf5447mnkcf4zc4k23pyk";
      polysemy-plugin = hackage "0.4.4.0" "08ry72bw78fis9iallzw6wsrzxnlmayq2k2yy0j79hpw4sp8knmg";
    };

  in hix.lib.pro ({ config, ... }: {
    packages.polysemy-test = ./packages/polysemy-test;
    devGhc.compiler = "ghc925";
    overrides = { inherit dev all; };
    ghci = {
      preludePackage = "incipit-core";
      preludeModule = "IncipitCore";
    };
    hpack.packages.polysemy-test = import ./ops/hpack.nix { inherit config; };
    hackage.versionFile = "ops/version.nix";
    shell.hls.package = hls.packages.${config.system}.haskell-language-server-925;
  });
}
