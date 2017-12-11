xautolock -time 10 -locker '~/.config/i3/lock.sh' &
xss-lock -- ~/.config/i3/lock.sh &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME/.dotfiles ~/.Xresources
#wal -c -i ~/.config/wallpapers/wall.jpg
exec dbus-launch --exit-with-session i3
