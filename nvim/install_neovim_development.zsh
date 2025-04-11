#!/bin/zsh

cd ~
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
tar zxvf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

sudo rm -rf /usr/local/bin/nvim-linux-x86_64 /usr/local/bin/nvim
sudo mv nvim-linux-x86_64 /usr/local/bin/
sudo ln -s /usr/local/bin/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

# plugpath="/usr/local/bin/nvim-linux-x86_64/share/nvim/runtime/plugin"
# sudo rm $plugpath/gzip.vim $plugpath/matchit.vim $plugpath/matchparen.vim $plugpath/shada.vim $plugpath/spellfile.vim $plugpath/tutor.vim $plugpath/zipPlugin.vim $plugpath/tohtml.lua $plugpath/tohtml.lua /usr/local/bin/nvim-linux-x86_64/share/nvim/runtime/ftplugin.vim
