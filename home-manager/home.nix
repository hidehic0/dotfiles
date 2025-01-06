{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
let 
  username = "hidehico";
in {
  nixpkgs = {
    config = {
      allowUnfree=false;
    };
  };

  home = {
    username = "hidehico";
    homeDirectory = "/home/hidehico";

    stateVersion = "24.11";
    packages = with pkgs;
    [
      black
      delta
      deno
      emacs
      fzf
      gh
      hugo
      lazydocker
      lazygit
      lua-language-server
      marksman
      online-judge-tools
      ruby
      ruff
      sheldon
      tree-sitter
      vim
    ];

    file = {
    };

    sessionVariables = {
    };

    enableNixpkgsReleaseCheck = false;
  };
  programs.home-manager.enable = true;
}
