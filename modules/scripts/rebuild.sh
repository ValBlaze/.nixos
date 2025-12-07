#!/usr/bin/env bash
set -x
set -e
pushd ~/.nixos
gen=$(((nix-env --list-generations --profile /nix/var/nix/profiles/system | grep current | awk '{print $1}') + 1))
git add .
git commit -m "gen $gen"
sudo nixos-rebuild switch --flake .
git push
popd
