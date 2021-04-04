#!/usr/bin/env zsh

base=${0:a:h:h:h}
nix flake check "$base/ops/nix/ghc-865"
nix flake check "$base/ops/nix/ghc-884"
nix flake check "$base/ops/nix/ghc-8104"
