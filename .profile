#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.local/bin` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export ZDOTDIR="$HOME"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[[0m')"; a="${a%_}"

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"
echo "$0" | grep "zsh$" >/dev/null && [ -f $ZDOTDIR/.zshrc ] && source "$ZDOTDIR/.zshrc"
