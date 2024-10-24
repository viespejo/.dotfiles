#!/bin/bash
KBDCFG=$(envsubst < /home/its32ve1/.dotfiles/kmonad-layers.kbd)
kmonad <(echo "$KBDCFG")
