xautolock -time 10 -locker '~/.config/i3/lock.sh' &
xss-lock -- ~/.config/i3/lock.sh &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME/.dotfiles ~/.Xresources
setxkbmap -layout us,es -option ctrl:nocaps,grp:shifts_toggle
#wal -c -i ~/.config/wallpapers/wall.jpg
exec dbus-launch --exit-with-session i3
