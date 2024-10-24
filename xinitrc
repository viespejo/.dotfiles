# numlock on
numlockx &
# disable pc speaker
xset -b
# repeat keys
# xset r rate 230 60
# setxkbmap -layout us -option 'compose:ralt'
#xautolock -time 10 -locker '~/.config/i3/lock.sh' &
#xss-lock -- ~/.config/i3/lock.sh &
userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap
# userkeymap=$HOME/.dotfiles/XkeymapEliteBook
# userkeymap=/home/its32ve1/.dotfiles/XkeymapForKmonadUSES
# enable touchpad tapping
xinput set-prop 12 "libinput Tapping Enabled" 1
# merge in defaults and keymaps
[[ -f "$userresources" ]] && xrdb -merge -I$HOME/.dotfiles "$userresources"
#setxkbmap -layout us,es -option ctrl:swapcaps,grp:shifts_toggle,altwin:swap_alt_win
#setxkbmap -layout us,es -option compose:menu
# keyboard
# setxkbmap -layout us -option 'compose:ralt'
#[[ -f "$usermodmap" ]] && xmodmap "$usermodmap"
# [[ -f "$userkeymap" ]] && xkbcomp "$userkeymap" $DISPLAY
#xcape -e 'Control_L=Escape'
#wal -c -i ~/.config/wallpapers/wall.jpg
# reset xkeymap when plug in a new keyboard
# inputplug -d -c ~/.dotfiles/scripts/xkbmap-reset.sh&
# i3
# exec dbus-launch --exit-with-session i3
exec dbus-launch i3
# exec dbus-launch awesome
