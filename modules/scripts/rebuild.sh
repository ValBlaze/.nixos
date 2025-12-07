#!/usr/bin/env bash
set -e
pushd ~/.nixos
current_gen=$(sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | grep current | awk '{print $1}')
new_gen=$((current_gen + 1))
git add .
git commit -m "gen $new_gen"
sudo nixos-rebuild switch --flake .
git push
popd
