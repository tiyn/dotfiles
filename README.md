# .dotfiles
My Arch Linux dotfiles. Most of them are personalized variants of the LARBS dotfiles files.

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

## baseinstallation.sh
This is a shell-script for setting up the most important programs in my opinion after the basic setup of Arch and the set-up done by LARBS by Luke Smith.
