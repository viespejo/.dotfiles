#!/bin/bash
KBDCFG=$(envsubst < /home/its32ve1/.dotfiles/kanata.kbd)
# write KBDCFG to temp file overwriting the old one
echo "$KBDCFG" > /tmp/kanata.kbd
kanata --cfg /tmp/kanata.kbd
