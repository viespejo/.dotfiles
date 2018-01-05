#!/bin/bash
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar example &

for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar top -c ~/.config/polybar/space & MONITOR=$i polybar bottom -c ~/.config/polybar/space & done
feh --bg-fill ~/.config/wallpapers/space.png
. ~/.config/i3/tmpscreen.sh

# for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar example -c ~/.config/polybar/config & done
# feh --bg-fill ~/.config/wallpapers/space.png
echo "Bars launched..."
