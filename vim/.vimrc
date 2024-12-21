const s:dpp_base = "~/.cache/dpp"

const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
const s:denops_src = '~/.cache/dpp/repos/github.com/vim-denops/denops.vim'

execute 'set runtimepath^=' .. s:dpp_src

if dpp#min#load_state(s:dpp_base)
  " NOTE: dpp#make_state() requires denops.vim
  execute 'set runtimepath^=' .. s:denops_src
  autocmd User DenopsReady
  \ call dpp#make_state(s:dpp_base, '{TypeScript config file path}')
endif

set clipboard&
set clipboard+=unnamedplus
set tabstop=2
inoremap <silent> jj <ESC>
