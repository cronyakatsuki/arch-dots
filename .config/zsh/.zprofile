export QT_QPA_PLATFORMTHEME=qt5ct
export SXHKD_SHELL='/usr/bin/sh'

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx $HOME/.config/X11/xinitrc &> /dev/null
# [[ $(fgconsole 2>/dev/null) == 1 ]] && exec start-river &> /dev/null

eval "$(ssh-agent -s)" &> /dev/null
