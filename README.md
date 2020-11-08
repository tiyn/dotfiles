# .dotfiles
My Server and root account dotfiles.

## Required/Recommended Software
### Required
- lsd
- git
- tmux
- neovim
- zsh (highly recommended) (change shell with: ```chsh -s /bin/zsh```)
- sc-im (recommended)
#### Debian-based Systems
- ```apt install git tmux neovim zsh```
- get the rest manually
  - https://github.com/Peltoche/lsd
  - https://github.com/andmarti1424/sc-im/wiki/Ubuntu-with-XLSX-import-&-export
#### Arch-based Systems
- Get the yay-AUR-pckagemanager or something similar (```pacman -S yay```).
- ```yay -S lsd git tmux neovim zsh sc-im```

## Migration of my dotfiles to other system
### set alias in .bashrc
```alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'```
### clone this repository
```git clone --bare https://github.com/TiynGER/.dotfiles $HOME/.dotfiles```
### checkout changes
```config checkout server```
### backup old files
```mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
### checkout changes
```config checkout server -f```
### set showUntrackedFiles to no
```config config --local status.showUntrackedFiles no```
### pull current setup
```config pull --set-upstream origin server```
