#!/bin/bash

## installing os-prober
sudo pacman os-prober

## finding other os
sudo grub-mkconfig -o /boot/grub/grub.cfg
