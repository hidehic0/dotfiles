{ config, pkgs, ... }:

{
  home.username = "hidehico";
  home.homeDirectory = "/home/hidehico";

  home.stateVersion = "24.11";
  home.packages = [
    pkgs.emacs
    pkgs.gh
    pkgs.neovim
    pkgs.sheldon
    pkgs.lazygit
    pkgs.deno
    pkgs.pypy310
    pkgs.fzf
    pkgs.ruff
    pkgs.lazydocker
    pkgs.lua-language-server
    pkgs.marksman
    pkgs.delta
    pkgs.black
    pkgs.tree-sitter
    pkgs.hugo
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
}
