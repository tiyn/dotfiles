#!/bin/bash

## remove calcurse
sudo pacman -Rns calcurse

## remove tree
sudo pacman -Rns tree

## remove vi
sudo pacman -Rns vi

## remove vifm
sudo pacman -Rns vifm


## add acpi
sudo pacman -S acpi

## add cmatrix
sudo pacman -S cmatrix

## add code
git clone https://aur.archlinux.org/visual-studio-code-bin.git $HOME/downloads/set\-ups/visual-studio-code-bin
cd $HOME/downloads/set\-ups/visual-studio-code-bin && makepkg -sirc

## add discord
git clone https://aur.archlinux.org/discord.git $HOME/downloads/set\-ups/discord
cd $HOME/downloads/set\-ups/discord && makepkg -sirc

## add docker
sudo pacman -S docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo groupadd docker
sudo gpasswd -a $USER docker

## add imagemagick
sudo pacman -S imagemagick

## add intellij-idea-community-edition
sudo pacman -S intellij-idea-community-edition

## add jdk8-openjdk
sudo pacman -S jdk8-openjdk

## add lastpass-cli-git
git clone https://aur.archlinux.org/lastpass-cli-git.git $HOME/downloads/set\-ups/lastpass-cli-git
cd $HOME/downloads/set\-ups/lastpass-cli-git && makepkg -sirc

## add lsd
sudo pacman -S lsd

## add lynx
sudo pacman -S lynx

## add maxima
sudo pacman -S maxima

## add mutt-wizard-git
git clone https://aur.archlinux.org/mutt-wizard-git.git $HOME/downloads/set\-ups/mutt-wizard-git
cd $HOME/downloads/set\-ups/mutt-wizard-git && makepkg -sirc

## add neofetch
sudo pacman -S neofetch

## add nm-connection-editor
sudo pacman -S nm-connection-editor

## add openssh
sudo pacman -S openssh

## add owncloud-client
sudo pacman -S owncloud-client

## add qt5ct
sudo pacman -S qt5ct

## add ranger
sudo pacman -S ranger

## add rsync
sudo pacman -S rsync

## add rtv
sudo pacman -S rtv

## add scim
git clone https://aur.archlinux.org/sc-im.git $HOME/downloads/set\-ups/sc-im
cd $HOME/downloads/set\-ups/sc-im && makepkg -sirc

## add spotify
git clone https://aur.archlinux.org/spotify.git $HOME/downloads/set\-ups/spotify
cd $HOME/downloads/set\-ups/spotfy && makepkg -sirc

## add sshpass
sudo pacman -S sshpass

## add texlive
sudo pacman -S texlive-most
sudo pacman -S texlive-lang

## add tor-browser
git clone https://aur.archlinux.org/tor-browser.git $HOME/downloads/set\-ups/tor-browser
cd $HOME/downloads/set\-ups/tor-browser && makepkg -sirc

## add gvim
sudo pacman -S gvim

## add vivaldi
git clone https://aur.archlinux.org/vivaldi.git $HOME/downloads/set\-ups/vivaldi
cd $HOME/downloads/set\-ups/vivaldi && makepkg -sirc

## add xournalpp
sudo pacman -S xournalpp

## add zip
sudo pacman -S jdk8-openjdk

