#!/bin/sh

# Cd into a directory using fzf
fcd () {
    dir=$(fd -a --type d --hidden --exclude ".git|.github" | fzf --prompt "Choose directory: ")
    [ -z $dir ] && return 1
    cd $dir
}

# Remove choosed stuff
frm () {
    remove=$(fd --hidden --maxdepth 1 | fzf -m --prompt "Choose to delete: ")
    [ -z $remove ] && return 1
    rm -rf $(printf '%s' $remove)
}

# Quicly choose stuff to add using fzf
fga () {
    git add $(git status -s | awk '{ print $2 }' | fzf -m)
}

# Open a script in path with vim quicly
vish () {
    nvim $(which $1)
}

# Create a directory and change into it
md () {
    mkdir -p "$@" && cd "$@"
}

# Move a file and create a link in it's place
mvln () {
    from=$(readlink -f $1)
    to=$(readlink -f $2)
    mv $from $to
    ln -s $to $from
}

# Find my script and let me edit them
se() {
    fd . ~/bin -L --type f --color=never | fzf --prompt "Choose script to edit: " \
        --preview 'bat --color=always --style=plain --pager=never {}' | xargs -r $EDITOR
}

# List my config and open the dir in a editor
ce() {
    fd . ~/.config -L --maxdepth 1 --color=never | fzf --prompt \
        "Choose config to edit: " --preview 'tree -a -C {}' | xargs -r $EDITOR
}

# List files in a directory and edit choosen one
vf(){
    fd -L --maxdepth 1 --type f --color=never --hidden | fzf --prompt "Choose script to edit: " \
        --preview 'bat --color=always --style=plain --pager=never {}' | xargs -r $EDITOR
}

# Install packages using paru
i() {
    paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}'| xargs -ro paru -S
}
# Remove installed packages
r() {
    paru -Qqe | fzf -q "$1" -m --preview 'paru -Qi {1}' | xargs -ro paru -Rnsc
}

# history search
h() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# Copy current working directory
cpdir() {
    pwd | tr -d "\r\n" | xclip -sel c
}

# Copy content of a file.
cf() {
    cat $1 | xclip -sel c
}

# Open a bookmark from buku in browser
fb() {
  buku --nostdin -p -f5 | fzf | cut -f1 | xargs -r buku --nostdin -o
}
