#!/usr/bin/env zsh

base=${0:a:h:h:h}

check()
{
  local ver=$1
  nix flake update "$base/ops/nix/ghc-$ver"
  nix build "$base/ops/nix/ghc-$ver"
}
check '865'
check '884'
check '8104'
