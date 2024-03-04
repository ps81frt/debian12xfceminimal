#!/bin/sh

sudo apt update
sudo apt upgrade -y

cp -r .config ~
cp .bashrc ~
cp .nanorc ~
cp .zshrc  ~
cp .vimrc ~
cp cleaner.sh ~

# https://wiki.debian.org/Xorg
sudo dpkg-reconfigure keyboard-configuration

## APP
sudo apt install -y \
    network-manager-gnome \
    zsh \
    libxfce4ui-utils \
    pcmanfm \
    xfce4-appfinder \
    xfce4-panel \
    xfce4-pulseaudio-plugin \
    xfce4-whiskermenu-plugin \
    xfce4-session \
    xfce4-settings \
    xfce4-terminal \
    xfconf \
    xfdesktop4 \
    xfwm4 \
    adwaita-qt \
    qt5ct \
    git \
    htop \
    fontconfig
    fontconfig-config  \
    fonts-dejavu-core \
    fonts-dejavu-extra \
    fonts-droid-fallback \
    fonts-font-awesome \
    fonts-lato \
    fonts-liberation2 \
    fonts-mathjax \
    fonts-noto-mono \
    fonts-opensymbol \
    fonts-quicksand \
    fonts-symbola \
    fonts-urw-base35 \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    terminator 




# Sound
sudo apt install -y pavucontrol pulseaudio pulseaudio-utils pasystray paprefs pavumeter pulseaudio-module-zeroconf

# Bluetooth 
sudo apt install -y blueman pulseaudio-module-bluetooth

# Hack nerd fonts
sudo apt install -y curl unzip zip
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
mkdir -p ~/.local/share/fonts
unzip Hack.zip -d ~/.local/share/fonts/
fc-cache
sudo apt install fonts-noto

# vim
sudo apt install -y vim
cp config/vimrc ~/.vimrc
sudo update-alternatives --set editor /usr/bin/vim.basic

# file manager
sudo apt install -y pcmanfm

# image viewer
sudo apt install -y nsxiv
sudo cp bin/cnsxiv /usr/local/bin
sudo chmod +x /usr/local/bin
mkdir -p ~/.local/share/applications
cp applications/* ~/.local/share/applications
cp config/mimeapps.list ~/.config

# mail
# gmail sign in with app passwords: https://support.google.com/mail/answer/185833?hl=en
sudo apt install -y sylpheed sylpheed-plugins

# pdf
sudo apt install -y zathura
mkdir ~/.config/zathura
cp config/zathurarc ~/.config/zathura/zathurarc

# video player
sudo apt install -y mpv

# screenshot
sudo apt install -y flameshot

# pager
sudo apt install -y most
sudo update-alternatives --set pager /usr/bin/most

# vscode
sudo apt-get install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code


# gtk2 theme for pcmanfm and sylpheed
sudo apt install -y lxappearance greybird-gtk-theme
cp config/.gtkrc-2.0 ~/.gtkrc-2.0

###
sudo apt install -y tldr xsel htop firefox-esr feh arandr

# starship
curl -sS https://starship.rs/install.sh | sh
echo "eval "'"$(starship init bash)"'"" >> ~/.bashrc

# update locale
# might be not necessary if you want to use the same locale for everything
sudo update-locale LC_TIME=fr_FR.utf8 LC_PAPER=fr_FR.utf8 LC_NAME=fr_FR.utf8 LC_ADDRESS=fr_FR.utf8 LC_TELEPHONE=fr_FR.utf8 LC_MEASUREMENT=fr_FR.utf8
setxkbmap fr
cp -r .config ~
cp .bashrc ~
cp .nanorc ~
cp .zshrc  ~
cp .vimrc ~
cp cleaner.sh ~
chsh -s /usr/bin/zsh
reboot
