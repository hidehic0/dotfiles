#!/bin/zsh

cd ~
wget wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
tar zxvf nvim-linux-x86_64.tar.gz

sudo rm -rf /usr/local/bin/nvim-linux-x86_64 /usr/local/bin/nvim
sudo mv nvim-linux-x86_64 /usr/local/bin/
sudo ln -s /usr/local/bin/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
