#!/usr/bin/env sh
pid=$(niri msg --json focused-window | jq -r .pid)

if [ "$(realpath /proc/"$pid"/exe)" = "$(command -v xwayland-satellite)" ]; then
	xdotool search --pid "$pid" windowkill
else
	kill -9 "$pid"
fi
