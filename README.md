# dotfiles

![vim-example](vim-example.png)

My arch compatible user dotfiles.
They were originally based on the dotfiles of [lukesmithxyz](https://github.com/lukesmithxyz/voidrice).
This being some time, hundreds of commits and my personalized version of [larbs](https://github.com/TiynGER/larbs) ago, they are now quite different.

## Required and Recommended Software

All requirements and recommendations get installed by my version of LARBS.
To take a look at all the software it installs look at the [progs.csv](https://github.com/TiynGER/larbs/blob/master/progs.csv)  in my LARBS repository.

## Migration of my dotfiles to other system

- set alias in .bashrc: `alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
- clone this repository: `git clone --bare https://github.com/Tiyn/dotfiles $HOME/.dotfiles`
- optional: backup old files:

```sh
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

- checkout changes: `config checkout`
- ignore untracked files: `config config --local status.showUntrackedFiles no`
- pull current setup: `config pull`
- finish setup for vim:
  - open vim

The step containing commenting out is needed because the colorscheme has
problems being not available and disrupts the further process of the plugin
installation.

## Ignore local changes to config files

If you need to make local changes to config files that are not to be pushed
run `config update-index --skip-worktree <file>` to stop git from showing them
having changes.

## Hotkeys

There are various shortcuts and hotkeys used in this version. Included in my build are the following.
[Dwm](https://github.com/tiyn/dwm)s and [st](https://github.com/tiyn/st)s hotkeys can be found in their repositories.

### SXHKD

| ModKey | Shift | Key               | Function                                                  |
| ------ | ----- | ----------------- | --------------------------------------------------------- |
| Super  |       | a                 | (sounds) Previous song                                    |
| Super  |       | b                 | (program) Spawn browser                                   |
| Super  |       | c                 | (sounds) Toggle looping of songs                          |
| Super  |       | d                 | (sounds) Next song                                        |
| Super  |       | f                 | (program) Spawn filemanager                               |
| Super  |       | i                 | (display) Stop recording                                  |
| Super  |       | m                 | (program) Spawn thunderbird                               |
| Super  |       | o                 | (display) Start replay window                             |
| Super  |       | p                 | (display) Save replay window                              |
| Super  |       | u                 | (display) Start recording window                          |
| Super  |       | r                 | (program) Spawn dmenu\_run                                |
| Super  |       | s                 | (sounds) Pause song                                       |
| Super  |       | x                 | (sounds) Toggle shuffling of songs                        |
| Super  | Shift | l                 | (keyboard) Toggle keymap                                  |
| Super  | Shift | r                 | (sxhkd) Restart sxkd                                      |
| Super  | Shift | Space             | (notifications) Close all notifications                   |
| Super  |       | [                 | (notifications) Toggle dunst dnd                          |
| Super  |       | ]                 | (sounds) Toggle mute                                      |
| Super  |       | \                 | (sounds) Toggle deaf                                      |
| Super  |       | F5                | (display) Enable 2 Screen Monitor                         |
| Super  |       | F6                | (keyboard) Toggle touchpad                                |
| Super  |       | F7                | (mounting) Mounting drives                                |
| Super  |       | F8                | (mounting) Unmounting drives                              |
| Super  |       | F9                | (network) Restart NetworkManager                          |
| Super  |       | F10               | (display) slock                                           |
| Super  |       | F11               | (shutdown) reboot                                         |
| Super  |       | F12               | (shutdown) shutdown                                       |
| Super  |       | Return            | (program) Spawn terminal                                  |
|        |       | Print             | (program) Prompt to take a screenshot                     |
|        |       | AudioMute         | (sound) Volume mute                                       |
|        |       | AudioMicMute      | (sound) Mic Mute                                          |
|        |       | AudioLowerVolume  | (sound) Volume lower                                      |
|        |       | AudioRaiseVolume  | (sound) Volume raise                                      |
|        |       | MonBrightnessDown | (display) Brightness decrease                             |
|        |       | MonBrightnessUp   | (display) Brightness increase                             |


## Additional configs

Additional configs (and for example firefox plugins) can be found in my [wiki](https://github.com/tiyn/wiki).
