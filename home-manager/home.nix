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
      allowUnfree=true;
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
      emacs
      fzf
      gh
      hugo
      isort
      lazydocker
      lazygit
      lua-language-server
      lua54Packages.luacheck
      marksman
      mise
      online-judge-tools
      ruby
      ruff
      selene
      sheldon
      shellcheck
      shfmt
      tree-sitter
      vim
      zoxide
    ];

    file = {
    };

    sessionVariables = {
    };

    enableNixpkgsReleaseCheck = false;
  };
  programs.home-manager.enable = true;
}
