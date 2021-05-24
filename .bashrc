#!/bin/bash

shopt -s autocd
set -o vi
stty -ixon # Disable ctrl-s and ctrl-q.
export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 4)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 4)\]\W\[$(tput setaf 4)\]]\[$(tput setaf 4)\]\[$(tput sgr0)\]\\$ "

source "$HOME/.config/aliasrc" 2>/dev/null # Load aliases

pfetch
