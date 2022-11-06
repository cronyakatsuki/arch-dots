BASE=$(PWD)
BIN = $(HOME)/bin
CONFIG = $(HOME)/.config
MKDIR = mkdir -p
LN = ln -vsf
LNDIR = ln -vs
PKGINSTALL = paru -S --noconfirm --needed

all: zsh xdg-user-dirs startx kitty picom fonts dunst theming nsxiv mpv lf opentabletdriver dk wayland river

zsh: ## Install my zsh config abd link my scripts
	$(PKGINSTALL) zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting starship pfetch-btw glow
	mkdir -p $(CONFIG)/zsh
	$(LN) $(BASE)/.zshenv $(HOME)/.zshenv
	$(LN) $(BASE)/.config/zsh/* $(CONFIG)/zsh
	$(LN) $(BASE)/.config/zsh/.* $(CONFIG)/zsh
	$(LN) $(BASE)/.config/starship.toml $(CONFIG)/starship.toml
	$(LN) $(BASE)/bin/* $(BIN)
	chsh -s /usr/bin/zsh

xdg-user-dirs: ## Create and manage XDG-USER-DIRS
	$(LN) $(BASE)/.config/user-dirs.dirs $(CONFIG)/user-dirs.dirs
	mkdir -p $(HOME)/.local/share/desktop
	mkdir -p $(HOME)/downs
	mkdir -p $(HOME)/.local/share/templates
	mkdir -p $(HOME)/.local/share/public
	mkdir -p $(HOME)/docs
	mkdir -p $(HOME)/music
	mkdir -p $(HOME)/pics
	mkdir -p $(HOME)/vids

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
	mkdir -p $(HOME)/.icons/default
	$(LN) $(BASE)/.config/Kvantum/* $(CONFIG)/Kvantum
	$(LN) $(BASE)/.config/gtk-2.0/* $(CONFIG)/gtk-2.0
	$(LN) $(BASE)/.config/gtk-3.0/* $(CONFIG)/gtk-3.0
	$(LN) $(BASE)/.config/qt5ct/* $(CONFIG)/qt5ct
	$(LN) $(BASE)/.icons/default/* $(HOME)/.icons/default

envycontrol: ## Install envycontrol
	$(PKGINSTALL) envycontrol

nsxiv: ## Install and setup nsxiv configuration
	$(PKGINSTALL) nsxiv
	mkdir -p $(CONFIG)/nsxiv/exec
	$(LN) $(BASE)/.config/nsxiv/exec/* $(CONFIG)/nsxiv/exec

mpv: ## Install and setup mpv configuration
	$(PKGINSTALL) mpv-mpris-git mpv-sponsorblock-minimal-git
	mkdir -p $(CONFIG)/mpv
	$(LN) $(BASE)/.config/mpv/* $(CONFIG)/mpv
	mkdir -p $(CONFIG)/mpv/scripts
	$(LN) /usr/lib/mpv/sponsorblock-minimal.lua $(CONFIG)/mpv/scripts/sponsorblock-minimal.lua
	$(LN) /usr/share/mpv/scripts/mpris.so $(CONFIG)/mpv/scripts/mpris.so

lf: ## Install and setup lf configuration
	$(PKGINSTALL) lf w3m unrar lhasa mupdf-tools mcomix-gtk3-git epub-thumbnailer-git python-pdf2image perl-image-exiftool ffmpegthumbnailer pup
	mkdir -p $(CONFIG)/lf
	$(LN) $(BASE)/.config/lf/* $(CONFIG)/lf

opentabletdriver: ## Install and setup opentabletdriver
	$(PKGINSTALL) opentabletdriver
	echo "blacklist wacom" | sudo tee -a /etc/modprobe.d/blacklist.conf
	echo "blacklist hid_uclogic" | sudo tee -a /etc/modprobe.d/blacklist.conf
	sudo modprobe -r wacom
	sudo modprobe -r hid_uclogic

dk: ## Install and setup dk configuration
	$(PKGINSTALL) dk polybar sxhkd xtitle-git qt5-wayland
	mkdir -p $(CONFIG)/dk
	mkdir -p $(CONFIG)/polybar
	$(LN) $(BASE)/.config/dk/* $(CONFIG)/dk
	$(LN) $(BASE)/.config/polybar/* $(CONFIG)/polybar

wayland: ## Basic wayland packages needed for nice usage
	$(PKGINSTALL) waylock wl-clipboard bemenu bemenu-wayland imv-git qt5-wayland qt6-wayland wbg grim slurp xdg-desktop-portal-wlr
	mkdir -p $(CONFIG)/waylock
	$(LN) $(BASE)/.config/waylock/* $(CONFIG)/waylock


river: ## Install and setup river wayland compositor
	$(PKGINSTALL) river-git
	mkdir -p $(CONFIG)/river
	$(LN) $(BASE)/.config/river/* $(CONFIG)/river
