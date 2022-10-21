#!/bin/sh

# exit if already run from start
[ -f "/tmp/dwm.lock" ] && exit

# make sure that we wont be run again
touch /tmp/dwm.lock

# give me my nice theme
# wal-seter

# start my bar
dwmblocks & disown dwmblocks

# start my torrent daemon
transmission-daemon & disown transmission-daemon

# start my clipboard manager
clipmenud & disown clipmenud

# fix polkit for me
lxsession & disown lxsession

# nice animations and compositing
picom & disown picom --experimental-backends

# sync for keepass and backup
syncthing & disown syncthing

# notification daemon
dunst & disown dunst

# my password manager
keepassxc & disown keepassxc

# just some stuppid stuff I hate my self for actually using
discord --start-minimized & disown discord
ferdium & disown ferdium
