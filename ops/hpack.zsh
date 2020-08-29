#!/usr/bin/env nix-shell
#!nix-shell -i zsh -p haskellPackages.hpack

setopt err_exit no_unset

base=${0:a:h:h}

cd $base/packages/polysemy-test
hpack 1>/dev/null
