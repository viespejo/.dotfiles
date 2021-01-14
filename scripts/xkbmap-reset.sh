#!/bin/sh
keymap=~/.Xkeymap

# echo >&2 "$@"
event=$1 id=$2 type=$3

case "$event $id $type" in
'XISlaveAdded 10 XIFloatingSlave')
        # echo >&2 "$@"
        xkbcomp "$keymap" "$DISPLAY" 2>/dev/null 1>/dev/null
esac
# xkbcomp ~/.Xkeymap $DISPLAY 2>/dev/null 1>/dev/null
