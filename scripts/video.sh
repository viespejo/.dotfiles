#!/bin/bash

#This is the ffmpeg command that the screencast shortcut in i3 will run.

#Picks a file name for the output file based on availability:

while [[ -f $HOME/Videos/video$n.mkv ]]
do
	n=$((n+1))
done
filename="$HOME/Videos/video$n.mkv"


polybar-msg hook is-recording 2
# #The actual ffmpeg command:
# ffmpeg \
# -f x11grab \
# -s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
# -i :0.0 \
#  -c:v libx264 -qp 0 -r 30 $filename
#  #-c:v ffvhuff -r 30 -c:a flac $filename


ffmpeg \
-f x11grab \
$(xdotool getwindowfocus getwindowgeometry | tr '\n' ' ' | gawk '{print "-s " $8 " -i +"$4 }') \
 -c:v libx264 -r 30 $filename
 #-c:v ffvhuff -r 30 -c:a flac $filename
