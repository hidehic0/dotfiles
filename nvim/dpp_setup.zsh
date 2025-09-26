mkdir -p ~/.local/share/nvim/dpp/repos/github.com
mkdir ~/.local/share/nvim/dpp/repos/github.com/Shougo
cd ~/.local/share/nvim/dpp/repos/github.com/Shougo
git clone --depth 1 https://github.com/Shougo/dpp.vim
git clone --depth 1 https://github.com/Shougo/dpp-ext-installer
git clone --depth 1 https://github.com/Shougo/dpp-ext-lazy
git clone --depth 1 https://github.com/Shougo/dpp-ext-toml
cd ..
mkdir vim-denops
cd vim-denops
git clone --depth 1 https://github.com/vim-denops/denops.vim
