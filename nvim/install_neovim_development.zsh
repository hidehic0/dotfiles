#!/bin/zsh

cd /tmp
git clone https://github.com/neovim/neovim.git --depth 1
cd neovim
sudo make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr/local
sudo make install
cd ..
sudo rm -rf neovim

# plugpath="/usr/local/bin/nvim-linux-x86_64/share/nvim/runtime/plugin"
# sudo rm $plugpath/gzip.vim $plugpath/matchit.vim $plugpath/matchparen.vim $plugpath/shada.vim $plugpath/spellfile.vim $plugpath/tutor.vim $plugpath/zipPlugin.vim $plugpath/tohtml.lua $plugpath/tohtml.lua /usr/local/bin/nvim-linux-x86_64/share/nvim/runtime/ftplugin.vim
