#!/bin/sh

xrandr --auto

[ -f "$HOME/.config/xorg/xprofile" ] && . "$HOME/.config/xorg/xprofile" # global autostart
[ -f "$HOME/.config/xorg/xlocal" ] && . "$HOME/.config/xorg/xlocal" # local autostart
[ -f "$HOME/.config/xorg/xdefaults" ] && xrdb -merge "$HOME/.config/xorg/xdefaults" # global resources
[ -f "$HOME/.config/xorg/xpcspec" ] && xrdb -merge "$HOME/.config/xorg/xpcspec" # local resources

setbg

csum=""
new_csum=$(sha1sum $(which dwm))
while true
do
    if [ "$csum" != "$new_csum" ]
    then
        csum=$new_csum
        dwm
    else
        exit 0
    fi
    new_csum=$(sha1sum $(which dwm))
    sleep 0.5
done
