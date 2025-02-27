#!/bin/bash

./paru.bash

# install zsh
paru -S zsh
echo "please input /bin/zsh"
sudo chsh

# install util ware
paru -S iwd
systemctl start iwd
systemctl enable iwd

paru -S neovim
paru -R neovim

# install wayland
paru -S wayland qt5-wayland qt6-wayland xorg-xwayland

# install window manager
paru -S sway hyprland dunst pulseaudio pavucontrol wayland rofi noto-fonts noto-fonts-cjk noto-fonts-emoji otf-monaspace swaylock-effects waybar ly
systemctl enable ly
