# Path exprt
typeset -U PATH path
path=("$HOME/.local/bin"  "$HOME/bin/dmenu/" "$HOME/bin/gaming/" "$HOME/bin/statusbar/" "$HOME/bin/misc/" "$HOME/bin/wayland" "$HOME/bin/fzf" "$path[@]")
export PATH

# Programs export
export EDITOR="nvim"
export READER="zathura"
export BOOK_READER="foliate"
export TERMINAL="kitty"
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE="nsxiv"
export OPENER="xdg-open"
export PAGER="less"
export WM="awesome"
export SUDO_ASKPASS="dmenu-pass"

# clipmenu settings
export CM_MAX_CLIPS=20
export CM_IGNORE_WINDOW="KeePassXC"
export CM_SELECTIONS="clipboard"
export CM_OWN_CLIPBOARD=1

# clean up
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export LESSHISTFILE="-"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CUDA_CACHE_PATH="$XDG_CONFIG_HOME/nv"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export KDEHOME="$XDG_CONFIG_HOME/kde"
export NBRC_PATH="$XDG_CONFIG_HOME/nbrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GOPATH="$XDG_DATA_HOME/go"
export HISTFILE="$XDG_STATE_HOME"/zsh/history 
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"

# fzf catppuccin theme
export FZF_DEFAULT_OPTS=" --reverse \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden --exclude ".git"'

# bemene options
export BEMENU_OPTS="-H 24 --fn 'JetBrainsMono Nerd Font 10' \
    --nf '#8aadf4' --nb '#1e2030' --af '#8aadf4' --ab '#1e2030' \
    --sb '#8aadf4' --sf '#1e2030' --tb '#8aadf4' --tf '#1e2030' \
    --ff '#8aadf4' --fb '#1e2030' --hb '#8aadf4' --hf '#1e2030' \
    --fbf '#8aadf4' --fbb '#1e2030'" 

# bat theme
export BAT_THEME="Catppuccin-mocha"

# lf icons
export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\

*.esd=:\
*.jpg=:\

*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\

*.ogm=:\
*.mp4=:\

*.m4v=:\

*.mp4v=:\
*.vob=:\
*.qt=:\

*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\

*.flc=:\
*.avi=:\

*.fli=:\
*.flv=:\

*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\

*.nix=:\

"o
