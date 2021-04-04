{
  system,
  inputs,
  compiler,
}:
inputs.tryp-hs.project {
  inherit system compiler;
  base = ./../..;
  packages = {
    polysemy-test = "packages/polysemy-test";
  };
  ghcid = {
    hls = false;
    prelude = "packages/polysemy-test/lib/Prelude.hs";
  };
  packageDir = "packages";
}
