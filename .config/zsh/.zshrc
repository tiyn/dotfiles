####################
# HELPER FUNCTIONS #
####################

precmd_vcs_info() { vcs_info }

precmd_functions+=( precmd_vcs_info )

zle-line-init() {
	zle -K viins
	echo -ne "\e[5 q"
}

preexec() { echo -ne '\e[5 q' ;}

local copy_widgets=(
    vi-yank vi-yank-eol vi-delete vi-backward-kill-word vi-change-whole-line
)

local paste_widgets=(
    vi-put-{before,after}
)

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
	   [[ $1 = 'block' ]]; then
	  echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] ||
	     [[ ${KEYMAP} == viins ]] ||
	     [[ ${KEYMAP} == '' ]]; then
	  echo -ne '\e[5 q'
	fi
}

function x11-clip-wrap-widgets() {
    local copy_or_paste=$1
    shift
    for widget in $@; do
        if [[ $copy_or_paste == "copy" ]]; then
            eval "
            function _x11-clip-wrapped-$widget() {
                zle .$widget
                xclip -in -selection clipboard <<<\$CUTBUFFER
            }
            "
        else
            eval "
            function _x11-clip-wrapped-$widget() {
                CUTBUFFER=\$(xclip -out -selection clipboard)
                zle .$widget
            }
            "
        fi
        zle -N $widget _x11-clip-wrapped-$widget
    done
}

function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        # for git prior to 1.7
        # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( " ${c3}+${ahead}${c2}" )
        # for git prior to 1.7
        # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${c4}-${behind}${c2}" )
        hook_com[branch]="${hook_com[branch]} [${remote}${(j:/:)gitstatus}]"
    fi
}

function +vi-git-stash() {
    local -a stashes
    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        hook_com[misc]+=" (${stashes} stashed)"
    fi
}

##################
# CUSTOM WIDGETS #
##################

_git_fix_master_main() {
  if [[ $BUFFER == git\ * ]]; then
    if [[ $BUFFER == *" master"* ]]; then
      if git rev-parse --verify main >/dev/null 2>&1 \
        && ! git rev-parse --verify master >/dev/null 2>&1; then
        BUFFER=${BUFFER//" master"/" main"}
      fi
    fi
  fi
  zle accept-line
}

zle -N _git_fix_master_main

bindkey "^M" _git_fix_master_main

#########
# STYLE #
#########

# Set style for version control
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*' formats "(%s) %c%u %b%m"
zstyle ':vcs_info:git*' actionformats "(%s|%a) %12.12i %c%u %b%m"
# Show remote ref name and number of commits ahead-of or behind
# Show count of stashed changes
zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash

# Set style for completion options
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Case insensitive completion
zmodload zsh/complist
_comp_options+=(globdots)

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# Set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# Switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# Set default Vim Cursor shape
zle -N zle-keymap-select
zle -N zle-line-init
echo -ne '\e[5 q'

# Set default prompt
PS1='%B%{$fg[blue]%}[%{$fg[blue]%}%n%{$fg[blue]%}@%{$fg[blue]%}%M %{$fg[blue]%}%~%{$fg[blue]%}]%{$reset_color%}\$%b '
RPROMPT='%B%{$fg[blue]%}$vcs_info_msg_0_%{$reset_color%}%b'
setopt prompt_subst

# Copy to x11 clipboard
x11-clip-wrap-widgets copy $copy_widgets
x11-clip-wrap-widgets paste  $paste_widgets

# Enable colors
autoload -U colors && colors

# Enable git info in prompt
autoload -Uz vcs_info

###############
# KEYBINDINGS #
###############

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Vim bindings in tab mode
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#######################
# ADDITIONAL FEATURES #
#######################

# Load alias
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc" # Load aliases

# Disable ctrl-s and ctrl-q.
stty -ixon

# Automatically cd if given a directory
setopt autocd autopushd

# Enable compinit
autoload -Uz compinit && compinit

# Plugin: command not found notice
source /usr/share/doc/pkgfile/command-not-found.zsh

# Plugin: fuzzy completion
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh

# Plugin: autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# Plugin: syntax highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Open shell with tmux always
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
    tmux attack-session -t $USER || tmux new-session -s $USER
fi

# set up thefuck
eval $(thefuck --alias)

# python
eval "$(pyenv init -)"

##########################
# COMMANDS BEFORE PROMPT #
##########################

# Display pfetch when starting zsh
pfetch
