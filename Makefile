BASE=$(PWD)
BIN = $(HOME)/bin
CONFIG = $(HOME)/.config
MKDIR = mkdir -p
LN = ln -vsf
LNDIR = ln -vs
PKGINSTALL = paru -S --noconfirm --needed


ryzenadj: ## Install ryzenadj
	$(PKGINSTALL) ryzenadj-git ryzen_smu-dkms-git

startx: ## setup xorg start x settings
	mkdir -p $(CONFIG)/X11
	$(LN) $(BASE)/.config/X11/* $(CONFIG)/X11

kitty: ## Install and setup kitty configuration
	$(PKGINSTALL) kitty
	mkdir -p $(CONFIG)/kitty
	$(LN) $(BASE)/.config/kitty/* $(CONFIG)/kitty

picom: ## Install and setup picom configuration
	$(PKGINSTALL) picom
	mkdir -p $(CONFIG)/picom
	$(LN) $(BASE)/.config/picom/* $(CONFIG)/picom

fonts: ## Setup fonts
	$(PKGINSTALL) nerd-fonts-ibm-plex-mono nerd-fonts-jetbrains-mono ipa-fonts noto-fonts-emoji

dunst: ## Install and setup dunst configuration
	$(PKGINSTALL) dunst libnotify
	mkdir -p $(CONFIG)/dunst
	$(LN) $(BASE)/.config/dunst/* $(CONFIG)/dunst

theming: ## Install and setup theming settings
	$(PKGINSTALL) kvantum qt5ct catppuccin-gtk-theme-macchiato catppuccin-macchiato-grub-theme-git \
    kvantum-theme-catppuccin-git papirus-folders-catppuccin-git xcursor-breeze
	papirus-folders --theme Papirus-Dark --color cat-macchiato-blue
	sudo sed -i 's/#GRUB_THEME=.*/GRUB_THEME="\/usr\/share\/grub\/themes\/catppuccin-macchiato\/theme.txt"/' /etc/default/grub
	sudo grub-mkconfig -o /boot/grub/grub.cfg
	mkdir -p $(CONFIG)/Kvantum
	mkdir -p $(CONFIG)/gtk-2.0
	mkdir -p $(CONFIG)/gtk-3.0
	mkdir -p $(CONFIG)/qt5ct
	$(LN) $(BASE)/.config/Kvantum/* $(CONFIG)/Kvantum
	$(LN) $(BASE)/.config/gtk-2.0/* $(CONFIG)/gtk-2.0
	$(LN) $(BASE)/.config/gtk-3.0/* $(CONFIG)/gtk-3.0
	$(LN) $(BASE)/.config/qt5ct/* $(CONFIG)/qt5ct

envycontrol: ## Install envycontrol
	$(PKGINSTALL) envycontrol

zathura: ## Install and setup zathura configuration
	$(PKGINSTALL) zathura zathura-pdf-mupdf
	mkdir -p $(CONFIG)/zathura
	$(LN) $(BASE)/.config/zathura/* $(CONFIG)/zathura

nsxiv: ## Install and setup nsxiv configuration
	$(PKGINSTALL) nsxiv
	mkdir -p $(CONFIG)/nsxiv
	$(LN) $(BASE)/.config/nsxiv/* $(CONFIG)/nsxiv

mpv: ## Install and setup mpv configuration
	$(PKGINSTALL) mpv-mpris-git mpv-sponsorblock-minimal-git mpv-thumbnail-script mpv
	mkdir -p $(CONFIG)/mpv
	$(LN) $(BASE)/.config/nsxiv/* $(CONFIG)/nsxiv

mpd: ## Install and setup mpd configuration
	$(PKGINSTALL) mpd mpdris2 ncmpcpp
	mkdir -p $(CONFIG)/mpd
	mkdir -p $(CONFIG)/ncmpcpp
	mkdir -p $(CONFIG)/mpDris2
	$(LN) $(BASE)/.config/mpd/* $(CONFIG)/mpd
	$(LN) $(BASE)/.config/ncmpcpp/* $(CONFIG)/ncmpcpp
	$(LN) $(BASE)/.config/mpDris2/* $(CONFIG)/mpDris2

lf: ## Install and setup lf configuration
	$(PKGINSTALL) lf w3m unrar lhasa mupdf-tools mcomix-gtk3-git epub-thumbnailer-git python-pdf2image perl-image-exiftool ffmpegthumbnailer pup
	mkdir -p $(CONFIG)/lf
	$(LN) $(BASE)/.config/lf/* $(CONFIG)/lf

newsboat: ## Install and setup newsboat configuration
	$(PKGINSTALL) newsboat cronie
	sudo systemctl enable cronie
	mkdir -p $(CONFIG)/newsboat
	$(LN) $(BASE)/.config/newsboat/* $(CONFIG)/newsboat
	echo "# minute hour day_of_month month day_of_week command
	*/30  *        *         *        *      /usr/bin/newsboat -x reload" | crontab

opentabletdriver: ## Install and setup opentabletdriver
	$(PKGINSTALL) opentabletdriver
	echo "blacklist wacom" | sudo tee -a /etc/modprobe.d/blacklist.conf
	echo "blacklist hid_uclogic" | sudo tee -a /etc/modprobe.d/blacklist.conf

transmission-daemon: ## Install and setup transmission-daemon configuration
	$(PKGINSTALL) transmission-cli
	mkdir -p $(CONFIG)/transmission-daemon
	$(LN) $(BASE)/.config/transmission-daemon/* $(CONFIG)/transmission-daemon

bspwm: ## Install and setup bspwm configuration
	$(PKGINSTALL) bspwm polybar sxhkd xtitle-git
	mkdir -p $(CONFIG)/bspwm
	mkdir -p $(CONFIG)/polybar
	mkdir -p $(CONFIG)/sxhkd
	$(LN) $(BASE)/.config/bspwm/* $(CONFIG)/bspwm
	$(LN) $(BASE)/.config/polybar/* $(CONFIG)/polybar
	$(LN) $(BASE)/.config/sxhkd/* $(CONFIG)/sxhkd
