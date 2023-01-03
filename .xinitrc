#!/bin/sh

xrandr --auto
#adding ressources
[ -f "$HOME/.config/xorg/xprofile" ] && . "$HOME/.config/xorg/xprofile"
[ -f "$HOME/.config/xorg/xlocal" ] && . "$HOME/.config/xorg/xlocal"
[ -f "$HOME/.config/xorg/xdefaults" ] && xrdb -merge "$HOME/.config/xorg/xdefaults"
[ -f "$HOME/.config/xorg/xpcspec" ] && xrdb -merge "$HOME/.config/xorg/xpcspec"

setbg
exec dwm
