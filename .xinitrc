#!/bin/sh

[ -f "$HOME/.xprofile" ] && xrdb -merge "$HOME/.xprofile"
[ -f "$HOME/.Xdefaults" ] && xrdb -merge "$HOME/.Xdefaults"
[ -f "$HOME/.Xpcspec" ] && xrdb -merge "$HOME/.Xpcspec"

xterm -geometry 80x24+10+10 -fn 10x20

exec i3
