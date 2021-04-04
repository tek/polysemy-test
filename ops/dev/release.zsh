#!/usr/bin/env zsh

setopt err_exit

result=/tmp/cabal-upload-polysemy-test
rm -rf $result
nix build '.#release' -o $result
nix develop -c $result
rm -rf $result
