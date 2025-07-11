#!/bin/sh
exec swayidle -w \
    timeout 600 "brightnessctl -s set 0%" resume "brightnessctl -r"\
    timeout 600 "notify-send -u critical 'Power' 'System will suspend in 20 minutes!'"\
    timeout 1200 "notify-send -u critical 'Power' 'Laptop will suspend in 10 minutes!'"\
    timeout 1200 "notify-send -u critical 'Power' 'Screen will turn off soon'"\
    timeout 1260 "wlr-randr --output eDP-1 --off" resume "wlr-randr --output eDP-1 --on"\
    timeout 1500 "notify-send -u critical 'Power' 'System will suspend in 5 minutes!'"\
    timeout 1740 "notify-send -u critical 'Power' 'System will suspend in 1 minute!'"\
    timeout 1790 "notify-send -u critical 'Power' 'System will suspend in 10 seconds!'"\
    timeout 1795 "notify-send -u critical 'Power' 'System will suspend in 5 seconds!'"\
    timeout 1800 "systemctl suspend-then-hibernate"
