#!/bin/bash

## uncomment multilib in /etc/pacman.conf before installing
## uncomment wanted programs (lines with one ### uncomment wanted programs (lines with one #))

## add lutris
#sudo pacman -S lutris
## driver (uncomment for 1.Nvidia 2.AMD 3.Intel)
#sudo pacman -S vulkan-icd-loader lib32-vulkan-icd-loader
#sudo pacman -S vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
#sudo pacman -S vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

## add tuxtype
#git clone https://aur.archlinux.org/tuxtype.git $HOME/downloads/set\-ups/tuxtype
#cd $HOME/downloads/set\-ups/tuxtype && makepkg -sirc

## add wine
#sudo pacman -S wine
