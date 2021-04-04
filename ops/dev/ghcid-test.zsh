#!/usr/bin/env zsh

setopt err_exit no_unset

pkg=$1 module=$2 name=$3 type_=$4 runner=$5
base="${0:a:h:h:h}/"
${0:h:h}/hpack.zsh
nix-shell $*[6,$] --pure -A 'legacyPackages.x86_64-linux.run' \
  --argstr pkg $pkg \
  --argstr module $module \
  --argstr name $name \
  --argstr 'type' $type_ \
  --argstr 'runner' $runner \
  --argstr 'base' $base \
  --run exit
