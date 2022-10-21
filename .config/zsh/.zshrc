# Config by
  # ____                            _    _         _             _    _
 # / ___|_ __ ___  _ __  _   _     / \  | | ____ _| |_ ___ _   _| | _(_)
# | |   | '__/ _ \| '_ \| | | |   / _ \ | |/ / _` | __/ __| | | | |/ / |
# | |___| | | (_) | | | | |_| |  / ___ \|   < (_| | |_\__ \ |_| |   <| |
 # \____|_|  \___/|_| |_|\__, | /_/   \_\_|\_\__,_|\__|___/\__,_|_|\_\_|
                       # |___/

# enable colors
autoload -U colors && colors
# Nice system info (I hate neofetch)
pfetch

eval "$(starship init zsh)"

# set options
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt HIST_IGNORE_ALL_DUPS                                     # Remove duplication off commands
setopt INC_APPEND_HISTORY                                       # Store commands immediately
export HISTTIMEFORMAT="[%F %T] "                                # History format

# History settings
HISTFILE="$XDG_DATA_HOME/history"
HISTSIZE=10000
SAVEHIST=5000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zcache
zmodload zsh/complist
compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)                                       # include hidden files

# Keybindings
bindkey -v
export KEYTIMEOUT=1

# plugins section
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh 2>/dev/null
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ];then
        dir="$(cat "$tmp")"
        rm -rf "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# load my aliases
[ -f "$XDG_CONFIG_HOME/zsh/aliasrc" ] && source "$XDG_CONFIG_HOME/zsh/aliasrc"
