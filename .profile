#!/bin/sh
# Profile file. Runs on login.

# Adds `~/.local/bin` and all subdirectories to $PATH
export PATH="$PATH:$(du "${HOME}/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export EDITOR="nvim"
export ZDOTDIR="${HOME}"

export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

export HISTFILE="${XDG_CACHE_HOME}/shhistory"
export TMUX_TMPDIR="${XDG_CACHE_HOME}/tmux"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[[0m')"; a="${a%_}"

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "${HOME}/.bashrc"
echo "$0" | grep "zsh$" >/dev/null && [ -f ${ZDOTDIR}/.zshrc ] && source "${ZDOTDIR}/.zshrc"
