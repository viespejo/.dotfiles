#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

if [[ ! -f /tmp/screen.png ]]; then . "$DIR/tmpscreen.sh"; fi

# pkill compton
i3lock -u -e -i /tmp/screen.png
# compton -b
