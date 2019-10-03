set -o vi
stty -ixon # Disable ctrl-s and ctrl-q.
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/shhistory

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc" # Load aliases

pfetch
