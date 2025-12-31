#!/usr/bin/env bash
set -e
whoami
echo "$HOME"
git remote -v
pushd "$HOME/.nixos"
git add .
git commit -am "gen"
git push
nh os switch .
popd
