#!/bin/sh

# Check ssd state
alias ssd-check="sudo smartctl -a /dev/nvme0n1 | grep -E -- 'Data Units Read:|Data Units Written:|Percentage Used:'"

# Adding colours to some of the regulas shit
alias grep='grep --color=auto'
alias ls='/usr/bin/ls -Alh --color=always --group-directories-first'
alias tree='tree -C'
alias less='less -R'
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

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
