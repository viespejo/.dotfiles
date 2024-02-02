#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/custom"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar example &

# only primary monitor
for i in $(polybar -m | grep 'primary' | awk -F: '{print $1}'); do
    MONITOR=$i polybar top -c "$DIR"/config.ini & MONITOR=$i polybar bottom -c "$DIR"/config.ini &
done
# not primary monitors
for i in $(polybar -m | grep -v 'primary' | awk -F: '{print $1}'); do
    MONITOR=$i polybar simple-bottom -c "$DIR"/config.ini &
done
feh --bg-fill ~/.config/wallpapers/arch_grey.jpg
. ~/.config/i3/tmpscreen.sh

# for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar example -c ~/.config/polybar/config & done
# feh --bg-fill ~/.config/wallpapers/space.png
echo "Bars launched..."
