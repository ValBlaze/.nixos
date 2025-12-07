#!/usr/bin/env bash
set -x
set -e

pushd ~/.nixos
echo "Running as: $(whoami)"
gen="$(sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | grep current)"
git commit -am "$gen"
git push
echo $gen
popd
