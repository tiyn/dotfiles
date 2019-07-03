#!/bin/bash

##remove vifm
sudo pacman -Rns vifm

##remove tree
sudo pacman -Rns tree

##remove calcurse
sudo pacman -Rns calcurse

##remove vi
sudo pacman -Rns vi


##add ranger
sudo pacman -S ranger

##add lsd
sudo pacman -S lsd

##add discord
git clone https://aur.archlinux.org/discord.git $HOME/downloads/set-ups/discord
cd $HOME/downloads/set-ups/discord && makepkg -sirc

##add lastpass-cli-git
git clone https://aur.archlinux.org/lastpass-cli-git.git $HOME/downloads/set-ups/lastpass-cli-git
cd $HOME/downloads/set-ups/lastpass-cli-git && makepkg -sirc

##add maxima
sudo pacman -S maxima

##add mutt-wizard-git
git clone https://aur.archlinux.org/mutt-wizard-git.git $HOME/downloads/set-ups/mutt-wizard-git
cd $HOME/downloads/set-ups/mutt-wizard-git && makepkg -sirc

##add spotify
git clone https://aur.archlinux.org/spotify.git $HOME/downloads/set-ups/spotify
cd $HOME/downloads/set-ups/spotfy && makepkg -sirc

##add tor-browser
git clone https://aur.archlinux.org/tor-browser.git $HOME/downloads/set-ups/tor-browser
cd $HOME/downloads/set-ups/tor-browser && makepkg -sirc

##add vivaldi
git clone https://aur.archlinux.org/vivaldi.git $HOME/downloads/set-ups/vivaldi
cd $HOME/downloads/set-ups/vivaldi && makepkg -sirc

##add jdk8-openjdk
sudo pacman -S jdk8-openjdk

##add zip
sudo pacman -S jdk8-openjdk

##add intellij-idea-community-edition
sudo pacman -S intellij-idea-community-edition

##add rtv
sudo pacman -S rtv

##add owncloud-client
sudo pacman -S owncloud-client

##add qt5ct
sudo pacman -S qt5ct

##add nm-connection-editor
sudo pacman -S nm-connection-editor

##add cmatrix
sudo pacman -S cmatrix

##add imagemagick
sudo pacman -S imagemagick

##add texlive
sudo pacman -S texlive-most
sudo pacman -S texlive-lang

##add xournalpp
sudo pacman -S xournalpp

##add code
git clone https://aur.archlinux.org/visual-studio-code-bin.git $HOME/downloads/set-ups/visual-studio-code-bin
cd $HOME/downloads/set-ups/visual-studio-code-bin && makepkg -sirc
