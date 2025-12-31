#!/usr/bin/env bash
pushd ~/.nixos || exit
git add .
git commit -am "gen"
git push
nh os switch .
popd || exit
