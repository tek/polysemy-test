#!/usr/bin/env zsh

setopt err_exit no_unset

# TODO make this an app as well
${0:h:h}/hpack.zsh

nix run '.#ghcid-test' -- $*
