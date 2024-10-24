#!/bin/bash

KBD_DEV=$(find /dev/input/by-*/*kbd* | fzf)
export KBD_DEV
# KBDCFG=$(envsubst < ~/.dotfiles/kmonad.kbd)
# KBDCFG=$(envsubst < ~/.dotfiles/kmonad_miryoku.kbd)
KBDCFG=$(envsubst < ~/.dotfiles/kmonad-layers.kbd)

kmonad <(echo "$KBDCFG")
