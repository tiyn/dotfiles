#!/bin/bash

## uncomment multilib in /etc/pacman.conf before installing

## installing lutris
sudo pacman -S lutris

## installing drivers (uncomment for 1.Nvidia 2.AMD 3.Intel)
##sudo pacman -S vulkan-icd-loader lib32-vulkan-icd-loader
##sudo pacman -S vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
##sudo pacman -S vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
