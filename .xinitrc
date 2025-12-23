#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrandr --auto

[ -f "$HOME/.config/xorg/xprofile" ] && . "$HOME/.config/xorg/xprofile" # global autostart
[ -f "$HOME/.config/xorg/xlocal" ] && . "$HOME/.config/xorg/xlocal" # local autostart
[ -f "$HOME/.config/xorg/xdefaults" ] && xrdb -merge "$HOME/.config/xorg/xdefaults" # global resources
[ -f "$HOME/.config/xorg/xpcspec" ] && xrdb -merge "$HOME/.config/xorg/xpcspec" # local resources

wallpaper desktop

csum=""
new_csum=$(sha1sum $(which dwm))

exec dwm
