#!/bin/sh

# Check ssd state
alias ssd-check="sudo smartctl -a /dev/nvme0n1 | grep -E -- 'Data Units Read:|Data Units Written:|Percentage Used:'"

# Adding colours to some of the regulas shit
alias grep='grep --color=auto'
alias ls='/usr/bin/exa -lab --icons --group-directories-first --git --no-time'
alias cp='cp -iv'
alias rm='rm -iv'
alias mkd='mkdir -pv'
alias tr="trash-put"
alias trr='trash-restore'
alias tree='tree -C'
alias less='less -R'
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Git aliases
alias g='git'
alias gst='git status -s'
alias gc='git commit'
alias ga='git add'
alias gpl="git pull"
alias gpom="git pull origin master"
alias gpu="git push"
alias gpuom="git push origin master"
alias gd="git diff"
alias gch="git checkout"
alias gnb="git checkout -b"
alias gac="git add . && git commit"
alias grs="git restore --staged ."
alias gre="git restore"
alias gr="git remote"
alias gcl="git clone"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gt="git ls-tree -r master --name-only"
alias grm="git remote"
alias gb="git branch"
alias gf="git fetch"

# Easier to type
alias vi='nvim'

# Humna readable + better output
alias df='df -h -x devtmpfs -x tmpfs -x usbfs -x loop'
alias free='free -m -h'

# speed up
alias spotdl='spotdl --output-format ogg -p "{artist}/{album}/{artists} - {title}.{ext}" --dt 8 --st 8'

# For when I stop a aur package make
alias pacman-rm-orphans='sudo pacman -Rnsc $(pacman -Qtdq)'

# Just cause I can't remember the command at all
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# Quickly see the hogger in the directory
alias dust='du -hd1 | sort -hr | sed "s/.\///g" | sed "/\.$/d"'

# Who want to remember this long ass commands
alias yta='yt-dlp -x -f bestaudio --external-downloader aria2c --external-downloader-args "-j 16 -s 16 -x 16 -k 5M" --audio-format vorbis -o "%(title)s.%(ext)s"'
alias ytvb='yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --external-downloader aria2c --external-downloader-args "-j 16 -s 16 -x 16 -k 5M" --add-metadata -o "%(title)s.%(ext)s"'
alias ytvf='yt-dlp --merge-output-format mp4 --format best --embed-thumbnail --external-downloader aria2c --external-downloader-args "-j 16 -s 16 -x 16 -k 5M" --add-metadata -o "%(title)s.%(ext)s"'

# Nice
alias dl='aria2c -j 16 -s 16 -x 16 -k 5M --file-allocation=none'

# ;)
alias lf='lf-run $@'

alias b='buku --suggest'
