#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

if [[ ! -f /tmp/screen.png ]]; then . "$DIR/tmpscreen.sh"; fi

# killall compton
killall -SIGUSR1 dunst # pause
i3lock -n -u -e -i /tmp/screen.png
killall -SIGUSR2 dunst # resume
# compton
