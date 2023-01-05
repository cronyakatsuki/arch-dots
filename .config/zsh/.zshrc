#!/bin/sh

pfetch

eval "$(starship init zsh)"

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

zstyle ':completion:*' rehash true

# Plugins
plug "kutsan/zsh-system-clipboard"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/completions"
plug "zap-zsh/vim"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-syntax-highlighting"

# Local source
plug "$XDG_CONFIG_HOME/zsh/aliases.zsh"
plug "$XDG_CONFIG_HOME/zsh/functions.zsh"

# History settings
setopt appendhistory
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T]"
# HISTSIZE=10000
# SAVEHIST=5000

HISTFILE="$XDG_STATE_HOME"/zsh/history
