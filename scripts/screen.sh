#!/bin/bash

#Feed this script either:
#	"l" for laptop screen only,
#	"w" for work screen layout,
#	or "d" for dual screen layout.

d() {
    # if [[ $(xrandr -q | grep VGA1\ con) ]]
	# then param $1
	# else echo "No VGA input detected."
	# fi
    param $1
}
dual() {
    [ -f ~/.screenlayout/dp12wqhd_laptop.sh ] && source ~/.screenlayout/dp12wqhd_laptop.sh
}
laptop() {
    [ -f ~/.screenlayout/laptop.sh ] && source ~/.screenlayout/laptop.sh
}
work() {
    [ -f ~/.screenlayout/dp12wqhd.sh ] && source ~/.screenlayout/dp12wqhd.sh
}
#mirror() { xrandr --addmode VGA1 $lapres && xrandr --output LVDS1 --mode $lapres --output VGA1 --mode $lapres ;}

param() {
case $1 in
	d) dual ;;
	w) work ;;
	l) laptop ;;
	*) echo -e "Invalid parameter. Add one of the following:\n\"d\" for dualscreen laptop and VGA.\n\"l\" for laptop only\n\"v\" for VGA only.\n\"h\" for HDMI only.";
esac ;}
d $1
