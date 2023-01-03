#!/bin/sh

xrandr --auto
#adding ressources
[ -f "$HOME/.config/xorg/xprofile" ] && . "$HOME/.config/xorg/xprofile"
[ -f "$HOME/.config/xorg/Xdefaults" ] && xrdb -merge "$HOME/.config/xorg/Xdefaults"
[ -f "$HOME/.config/xorg/Xpcspec" ] && xrdb -merge "$HOME/.config/xorg/Xpcspec"

setbg
exec dwm
