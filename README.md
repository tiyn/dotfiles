# .dotfiles

My Arch Linux dotfiles.
They were originally based on the dotfiles of [lukesmithxyz](https://github.com/lukesmithxyz/voidrice).
This being some time, hundreds of commits and my personalized version of [larbs](https://github.com/TiynGER/larbs) ago, they are now quite different.

## Required and Recommended Software

All requirements and recommendations get installed by my version of LARBS.
To take a look at all the software it installs look at the progs.csv in my LARBS repository (https://github.com/TiynGER/larbs/blob/master/progs.csv)

## Migration of my dotfiles to other system

### set alias in .bashrc

`alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

### clone this repository

`git clone --bare https://github.com/TiynGER/.dotfiles $HOME/.dotfiles`

### checkout changes

`config checkout`

### backup old files

```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

### checkout changes

`config checkout`

### set showUntrackedFiles to no

`config config --local status.showUntrackedFiles no`

### pull current setup

`config pull`

## Hotkeys

There are various shortcuts and hotkeys used in this version. Included in my build are the following.

### DWM

| ModKey | Shift | Key               | Function                                                  |
| ------ | ----- | ----------------- | --------------------------------------------------------- |
| Super  | Shift | Escape            | Quit dwm                                                  |
| Super  | Shift | b                 | Toggle dwmbar                                             |
| Super  | Shift | c                 | Enable deck(/card) layout                                 |
| Super  | Shift | d                 | Toggle floating/tiled for selected window                 |
| Super  | Shift | f                 | Toggle fullscreen                                         |
| Super  |       | h                 | (Tiling/Deck) Focus window higher in stack than current   |
| Super  | Shift | h                 | (Tiling/Deck) Make current window the master window       |
| Super  |       | j                 | (Tiling/Deck) Focus window lower in stack than current    |
| Super  | Shift | j                 | (Tiling/Deck) Make current window the master window       |
| Super  |       | k                 | (Tiling/Deck) Focus window higher in stack than current   |
| Super  | Shift | k                 | (Tiling/Deck) Make current window the master window       |
| Super  |       | l                 | (Tiling/Deck) Focus window lower in stack than current    |
| Super  | Shift | m                 | Enable monocle layout	                                 |
| Super  | Shift | o                 | (Tiling/Deck) Increase master window size                 |
| Super  |       | q                 | Close current window                                      |
| Super  | Shift | t                 | Enable tiling layout                                      |
| Super  | Shift | z                 | (Tiling/Deck) Decrease master window size                 |
| Super  |       | 0                 | Show all tags                                             |
| Super  | Shift | 0                 | Add current window to all tag                             |
| Super  | 		 | 1/2/.../9		 | Show tag 1/2/.../9                                        |
| Super  | Shift | 1/2/.../9		 | Add current window to tag 1/2/.../9                       |
| Super  | 		 | .				 | Show monitor lower in stack                               |
| Super  | Shift | .				 | Add to monitor lower in stack                             |
| Super  |		 | ,				 | Show monitor higher in stack                              |
| Super  | Shift | ,				 | Add to monitor higher in stack                            |
| Super  |       | Return            | Spawn terminal                                                  |
| Super  |       | b                 | Spawn browser                                             |
| Super  | Shift | b                 | Toggle dwmbar                                             |
| Super  |       | f                 | Spawn filemanager                                        |
| Super  |       | i                 | Spawn intellij-idea-ultimate-edition                      |
| Super  |       | m                 | Spawn thunderbird                                         |
| Super  |       | p                 | Spawn ncmpcpp in st                                       |
| Super  | Shift | r                 | (dmenu) dmenu\_run                                         |
| Super  |       | s                 | (dmenu) startpagesearch                                   |
| Super  |       | F5                | enable 2 Screen Monitor                                   |
| Super  |       | F6                | toggle touchpad                                           |
| Super  |       | F7                | (dmenu) mounting drives                                   |
| Super  |       | F8                | (dmenu) unmounting drives                                 |
| Super  |       | F9                | Restart NetworkManager                                    |
| Super  |       | F10               | (dmenu) prompt, if yes: slock                             |
| Super  |       | F11               | (dmenu) prompt, if yes: reboot                            |
| Super  |       | F12               | (dmenu) prompt, if yes: shutdown                          |
|        |       | AudioMute         | Volume mute                                               |
|        |       | AudioMicMute      | Mic Mute                                                  |
|        |       | AudioLowerVolume  | Volume lower                                              |
|        |       | AudioRaiseVolume  | Volume raise                                              |
|        |       | MonBrightnessDown | Brightness decrease                                       |
|        |       | MonBrightnessUp   | Brightness increase                                       |
