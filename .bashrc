#!/bin/bash

shopt -s autocd
set -o vi
stty -ixon # Disable ctrl-s and ctrl-q.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\[$(tput sgr0)\]\\$ "
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/shhistory

source "$HOME/.config/aliasrc" 2>/dev/null # Load aliases
