#!/usr/bin/env bash
set -e
whoami
echo "$HOME"
git remote -v
pushd "$HOME/.nixos"
git add .
git commit -am "gen"
git push --quiet
nh os switch .
popd
