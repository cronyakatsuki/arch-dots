#!/bin/sh

# exit if already run from start
[ -f "/tmp/dwm.lock" ] && exit

# make sure that we wont be run again
touch /tmp/dwm.lock

# give me my nice theme
# wal-seter

# start my bar
# dwmblocks & disown dwmblocks

# My program bindings
start-program sxhkd -c "$HOME/.config/sxhkd/general"

# start my torrent daemon
start-program transmission-daemon

# sync for keepass and backup
start-program syncthing

# fix polkit for me
start-program lxsession

# nice animations and compositing
start-program picom

# start my clipboard manager
start-program clipmenud

# notification daemon
start-program dunst

# just some stuppid stuff I hate my self for actually using
start-program discord --start-minimized

# my password manager
start-program keepassxc
