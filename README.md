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
[Dwm](https://github.com/tiyn/dwm)s and [st](https://github.com/tiyn/st)s hotkeys can be found in their repositories.

### SXHKD

| ModKey | Shift | Key               | Function                                                  |
| ------ | ----- | ----------------- | --------------------------------------------------------- |
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
