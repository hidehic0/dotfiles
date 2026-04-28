{ pkgs, inputs, ... }:
let
  dpp-vim = pkgs.vimUtils.buildVimPlugin {
    pname = "dpp.vim";
    src = inputs.dpp-vim;
    version = "unstable";
  };
  dpp-ext-lazy = pkgs.vimUtils.buildVimPlugin {
    pname = "dpp-ext-lazy";
    src = inputs.dpp-ext-lazy;
    version = "unstable";
  };
  dpp-ext-toml = pkgs.vimUtils.buildVimPlugin {
    pname = "dpp-ext-toml";
    src = inputs.dpp-ext-toml;
    version = "unstable";

  };
  dpp-ext-installer = pkgs.vimUtils.buildVimPlugin {
    pname = "dpp-ext-installer";
    src = inputs.dpp-ext-installer;
    version = "unstable";
  };
  dpp-protocol-git = pkgs.vimUtils.buildVimPlugin {
    pname = "dpp-protocol-git";
    src = inputs.dpp-protocol-git;
    version = "unstable";
  };
  denops-vim = pkgs.vimUtils.buildVimPlugin {
    pname = "denops.vim";
    version = "unstable";
    src = inputs.denops-vim;
  };
in
{
  programs.vim = {
    enable = true;
    plugins = [
      dpp-vim
      dpp-ext-lazy
      dpp-ext-installer
      dpp-protocol-git
      dpp-ext-toml
      denops-vim
    ];
    extraConfig = ''
      set nocompatible
      set background=dark
      let mapleader = "\<Space>"

      let g:denops#server#deno_args = ['-q', '--no-lock', '--unstable-kv', '--unstable-ffi', '-A']

      inoremap <silent> jj <ESC>
      inoremap { {}<LEFT>
      inoremap ( ()<LEFT>
      inoremap [ []<LEFT>
      inoremap " ""<LEFT>

      set clipboard=unnamedplus
      set number
      set relativenumber
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set softtabstop=2

      const s:dpp_base ="~/.cache/dpp/"
    ''
    + builtins.concatStringsSep "" (
      map (plugin: "execute  'set runtimepath^=${plugin}'\n") [
        dpp-vim
        dpp-ext-lazy
        dpp-ext-toml
        dpp-ext-installer
        dpp-protocol-git
      ]
    )
    + ''
      if dpp#min#load_state(s:dpp_base)
        execute 'set runtimepath^=${denops-vim}'

        autocmd User DenopsReady
          \ : echohl WarningMsg
          \ | echomsg 'dpp load_state() is failed'
          \ | echohl NONE
          \ | call dpp#make_state(s:dpp_base, '~/.dotfiles/vim/dpp.ts')
        else
        autocmd BufWritePost *.toml
              \ : if !dpp#sync_ext_action('installer', 'getNotInstalled')->empty()
              \ |  call dpp#async_ext_action('installer', 'install')
              \ | endif

      endif

      autocmd User Dpp:makeStatePost
            \ : echohl WarningMsg
            \ | echomsg 'dpp make_state() is done'
            \ | echohl NONE

      filetype indent plugin on
      syntax on
    ''
    + "inoremap ' ''<LEFT>";
  };
}
