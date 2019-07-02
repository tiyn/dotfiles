#!/bin/sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile
[ -f "$HOME/.Xdefaults" ] && xrdb -merge "$HOME/.Xdefaults"
xterm -geometry 80x24+10+10 -fn 10x20

exec i3
