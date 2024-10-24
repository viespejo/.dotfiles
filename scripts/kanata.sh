#!/bin/bash

KBD_DEV=$(find /dev/input/by-*/*kbd* | fzf)
export KBD_DEV

KBDCFG=$(envsubst < ~/.dotfiles/kanata.kbd)
# write KBDCFG to temp file
echo "$KBDCFG" > /tmp/kanata.kbd
kanata --cfg /tmp/kanata.kbd
