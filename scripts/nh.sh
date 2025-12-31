#!/usr/bin/env bash
set -e
pushd "$HOME/.nixos"
git add .
git commit -am "gen"
git push --quiet
nh os switch .
popd
