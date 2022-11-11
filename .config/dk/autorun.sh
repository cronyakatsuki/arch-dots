#!/bin/sh

# start my torrent daemon
start-program transmission-daemon

# start my clipboard manager
start-program clipmenud

# fix polkit for me
start-program lxsession

# nice animations and compositing
start-program picom --experimental-backends

# sync for keepass and backup
start-program syncthing

# notification daemon
start-program dunst

# just some stuppid stuff I hate my self for actually using
# start-program discord --start-minimized
# start-program ferdium

# my password manager
start-program keepassxc

# my bar
start-program polybar top -r

# my music
start-program mpd
start-program mpDris2

# my custom startpage
python3 -m http.server --directory ~/repos/startpage 8385
