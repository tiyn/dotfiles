#!/bin/sh
exec swayidle -w \
    timeout 20 'systemctl suspend-then-hibernate'
    before-sleep 'swaylock'
    # timeout 1500 "notify-send -u critical 'Power' 'Laptop will suspend in 5 minutes!'"\
    # timeout 1740 "notify-send -u critical 'Power' 'System will suspend in 1 minute!'"\
    # timeout 1800 "systemctl suspend-then-hibernate"
