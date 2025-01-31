#!/bin/zsh

cd ~
rm nvim-linux-x86_64.appimage
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo mv ./nvim-linux-x86_64.appimage /sbin/nvim
