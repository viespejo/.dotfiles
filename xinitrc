# disable pc speaker
xset -b

xautolock -time 10 -locker '~/.config/i3/lock.sh' &
xss-lock -- ~/.config/i3/lock.sh &
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userkeymap=$HOME/.Xkeymap
# enable touchpad tapping
xinput set-prop 12 "libinput Tapping Enabled" 1
# merge in defaults and keymaps
[[ -f "$userresources" ]] && xrdb -merge -I$HOME/.dotfiles "$userresources"
# setxkbmap -layout us,es -option ctrl:swapcaps,grp:shifts_toggle,altwin:swap_alt_win
#[[ -f "$usermodmap" ]] && xmodmap "$usermodmap"
[[ -f "$userkeymap" ]] && xkbcomp "$userkeymap" $DISPLAY
#xcape -e 'Control_L=Escape'
#wal -c -i ~/.config/wallpapers/wall.jpg
exec dbus-launch --exit-with-session i3
