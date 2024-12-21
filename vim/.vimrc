set nocompatible

const s:dpp_base = "~/.cache/dpp"

const s:dpp_src = '~/.cache/dpp/repos/github.com/Shougo/dpp.vim'
const s:denops_src = '~/.cache/dpp/repos/github.com/vim-denops/denops.vim'

execute 'set runtimepath^=' .. s:dpp_src

if s:dpp_base->dpp#min#load_state()
  " NOTE: dpp#make_state() requires denops.vim
  " NOTE: denops.vim and dpp plugins are must be added
  execute 'set runtimepath^=' .. s:denops_src
  "execute 'set runtimepath^=' .. s:denops_installer

  autocmd User DenopsReady
  \ : echohl WarningMsg
  \ | echomsg 'dpp load_state() is failed'
  \ | echohl NONE
  \ | call dpp#make_state(s:dpp_base, '~/.config/vim/dpp.ts')
endif

autocmd User Dpp:makeStatePost
      \ : echohl WarningMsg
      \ | echomsg 'dpp make_state() is done'
      \ | echohl NONE

filetype indent plugin on

if has('syntax')
  syntax on
endif

set clipboard&
set clipboard+=unnamedplus
set tabstop=2
inoremap <silent> jj <ESC>
