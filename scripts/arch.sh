#!/bin/bash

#This is a lazy script I have for auto-installing Arch.

pacman -S --noconfirm dialog || (echo "Error at script start: Are you sure you're running this as the root user? Are you sure you have an internet connection?" && exit)
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

dialog --defaultno --title "DON'T BE A BRAINLET!" --yesno "\nThis is an Arch install script that is very rough around the edges. This script is only really for me so I can autoinstall Arch.\n\nVicente Espejo"  10 60 || exit

dialog --no-cancel --inputbox "Enter a name for your computer." 10 60 2> comp

timedatectl set-ntp true
