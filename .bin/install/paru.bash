#!/bin/bash

cd /tmp
sudo pacman -Syyu
sudo pacman -S --needed base-devel
wget https://aur.archlinux.org/cgit/aur.git/snapshot/paru-bin.tar.gz
tar zxvf paru-bin.tar.gz
cd paru-bin
makepkg
echo "run: sudo pacman \$pkgname-\$pkgver-\$pkgrel-\$arch.pkg.tar.xz"
