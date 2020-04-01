# .dotfiles
My Arch Linux dotfiles. 
They were originally based on the dotfiles of [lukesmithxyz](https://github.com/lukesmithxyz/voidrice).
This being some time, hundreds of commits and my personalized version of [larbs](https://github.com/TiynGER/larbs) ago, they are now quite different.

## Required and Recommended Software
All requirements and recommendations get installed by my version of LARBS.
To take a look at all the software it installs look at the progs.csv in my LARBS repository (https://github.com/TiynGER/larbs/blob/master/progs.csv)

## Migration of my dotfiles to other system
### set alias in .bashrc
```alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
### clone this repository
```git clone --bare https://github.com/TiynGER/.dotfiles $HOME/.dotfiles```
### checkout changes
```config checkout```
### backup old files
```mkdir -p .config-backup && \ 
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
### checkout changes
```config checkout```
### set showUntrackedFiles to no
```config config --local status.showUntrackedFiles no```
### pull current setup
```config pull```
