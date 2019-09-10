#!/bin/bash

##adding thinkfan
git clone https://aur.archlinux.org/thinkfan $HOME/downloads/set\-ups/thinkfan
cd $HOME/downloads/set\-ups/thinkfan
makepkg -sirc

##adding support for touchpad
pacman -S xf86-input-synaptics
