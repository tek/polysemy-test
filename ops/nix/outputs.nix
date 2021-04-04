{
  tryp-hs,
  compiler,
  overrides ? _: _: _: {}
}:
tryp-hs.flake {
  main = "polysemy-test";
  inherit compiler overrides;
  base = ./../..;
  packages.polysemy-test = "packages/polysemy-test";
  ghci.extraArgs = ["-fplugin=Polysemy.Plugin"];
  ghcid.prelude = "packages/polysemy-test/lib/Prelude.hs";
  packageDir = "packages";
}
