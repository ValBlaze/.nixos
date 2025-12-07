#!/usr/bin/env bash
set -e

pushd ~/.nixos
gen="$(sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | grep current)"
git commit -am "$gen"
git push
popd
