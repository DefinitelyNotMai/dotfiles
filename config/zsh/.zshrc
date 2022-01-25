# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PROMPT
autoload -U colors && colors
nL=$'\n'
PS1="%~$nL%(?.%F{green}0%f.%F{red}1)%f %F{yellow}%B$%b%f "

# History
HISTSIZE=100000
SAVEHIST=100000

# Sources
[ -f "$XDG_CONFIG_HOME/shell/aliasrc" ] && source "$XDG_CONFIG_HOME/shell/aliasrc"
# COMPLETIONS
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Vi Mode
bindkey -v
export KEYTIMEOUT=1

# Vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change dir with lf
lfcd () {
    tmp="$(mktemp)"
    lfrun -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
