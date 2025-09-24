#!/bin/bash


sudo -v


while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &




echo "Installing yay..."
sudo pacman -S --needed --noconfirm git base-devel
cd "$HOME" || exit
if [ ! -d "yay-bin" ]; then
    git clone https://aur.archlinux.org/yay-bin.git
fi
cd yay-bin || exit
makepkg -si --noconfirm
cd "$HOME" || exit




PACMAN_PACKAGES=(
    firefox
    git
    zsh
    neovim
    fzf
    exa
    zoxide
    fastfetch
    rofi
    python-pip
    imagemagick
    blueberry
    playerctl
    brightnessctl
    man
    copyq
    networkmanager
)

echo "Installing official packages..."
sudo pacman -S --needed --noconfirm "${PACMAN_PACKAGES[@]}"




AUR_PACKAGES=(
    tty-clock
    hyprpaper
    spotify
    spacify
)

echo "Installing AUR packages..."
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"




echo "Installing pywal16..."
pip install --break-system-packages pywal16

echo "Installation complete!"

