# Config by
  # ____                            _    _         _             _    _
 # / ___|_ __ ___  _ __  _   _     / \  | | ____ _| |_ ___ _   _| | _(_)
# | |   | '__/ _ \| '_ \| | | |   / _ \ | |/ / _` | __/ __| | | | |/ / |
# | |___| | | (_) | | | | |_| |  / ___ \|   < (_| | |_\__ \ |_| |   <| |
 # \____|_|  \___/|_| |_|\__, | /_/   \_\_|\_\__,_|\__|___/\__,_|_|\_\_|
                       # |___/

export QT_QPA_PLATFORMTHEME=qt5ct

export SXHKD_SHELL='/usr/bin/sh'

# run wm
[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx $HOME/.config/X11/xinitrc &> /dev/null
# [[ $(fgconsole 2>/dev/null) == 1 ]] && exec start-river &> /dev/null

eval "$(ssh-agent -s)" &> /dev/null
