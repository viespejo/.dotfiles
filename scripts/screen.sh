#!/bin/bash

#Feed this script either:
#	"l" for laptop screen only,
#	"w" for work screen layout,
#	or "h" for house screen layout.

d() {
    # if [[ $(xrandr -q | grep VGA1\ con) ]]
	# then param $1
	# else echo "No VGA input detected."
	# fi
    param $1
}
home() { xrandr --output EDP1 --auto --output VGA1 --auto --right-of EDP1 ;}
laptop() {
    [ -f ~/.screenlayout/laptop.sh ] && source ~/.screenlayout/laptop.sh
}
work() {
    [ -f ~/.screenlayout/work.sh ] && source ~/.screenlayout/work.sh
}
#mirror() { xrandr --addmode VGA1 $lapres && xrandr --output LVDS1 --mode $lapres --output VGA1 --mode $lapres ;}

param() {
case $1 in
	h) dual ;;
	w) work ;;
	l) laptop ;;
	*) echo -e "Invalid parameter. Add one of the following:\n\"d\" for dualscreen laptop and VGA.\n\"l\" for laptop only\n\"v\" for VGA only.\n\"h\" for HDMI only.";
esac ;}
d $1
