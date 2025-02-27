#!/bin/bash

# paru install
sudo pacman -Syyu
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
