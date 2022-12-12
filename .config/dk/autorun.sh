#!/bin/sh

# start my torrent daemon
start-program transmission-daemon

# start syncthing
start-program syncthing

# fix polkit for me
start-program lxsession

# nice animations and compositing
start-program picom --experimental-backends

# start my clipboard manager
start-program clipmenud

# notification daemon
start-program dunst

# just some stuppid stuff I hate my self for actually using
# I love me some flatpak
flatpak run com.discordapp.Discord --start-minimized
# start-program ferdium

# my password manager
start-program keepassxc

sleep 1

# my bar
start-program polybar top -r
