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
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
  home.enableNixpkgsReleaseCheck = false;
}
