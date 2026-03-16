# .dotfiles

![vim-example](vim-example.jpg)

My debian-based/arch compatible server/root-account dotfiles.

## Required/Recommended Software

### Required

- git
- tmux
- zsh
- eza
- sc-im (recommended)
- tree-sitter (recommended)
- neovim (>0.10.0)

#### Debian-based Systems

- `apt install git tmux zsh`
- get the rest manually
  - [eza](https://github.com/eza-community/eza)
  - [sc-im (recommended)](https://github.com/andmarti1424/sc-im/wiki/Ubuntu-with-XLSX-import-&-export)
- `apt install neovim` (read note below!)
- `apt install tree-sitter` (read note below!)

For some Debian systems it can be useful to install neovim manually to get a newer version number
than the one shipped with the slow debian release schedule.
For this the following lines can be used.

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /usr/local/nvim
sudo ln -s /usr/local/nvim/bin/nvim /usr/local/bin/nvim
```

Updating works accordingly.

The same goes for tree-sitter.

```sh
curl -L https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz \
| gunzip > tree-sitter
chmod +x tree-sitter
sudo mv tree-sitter /usr/local/bin/
```

#### Arch-based Systems

- Get the yay-AUR-pckagemanager or something similar (`pacman -S yay`).
- `yay -S eza git tmux neovim zsh sc-im`

## Migration of my dotfiles to other system

- set alias in .bashrc: `alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
- clone this repository: `git clone --bare https://github.com/Tiyn/dotfiles $HOME/.dotfiles`
- optional: backup old files:
```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
- checkout changes: `config checkout server`
- ignore untracked files: `config config --local status.showUntrackedFiles no`
- pull current setup: `config pull --set-upstream origin server`
- finish setup for vim:
  - open vim
  - `:PlugInstall`
  - `:CocInstall`
- change shell to zsh: `chsh -s /bin/zsh`
  - it is possible that you're asked for a password. If so you need to change
  the line in `/etc/pam.d/chsh` from `auth required pam_shells.so` to
  `auth sufficient pam_sehlls.so`
