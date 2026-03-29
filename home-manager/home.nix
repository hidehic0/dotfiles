{ ... }:
{
  imports = [
    ./filemap.nix
    ./gui.nix
    ./git.nix
    ./zsh.nix
    ./neovim.nix
    ./hyprland.nix
    ./gtk.nix
    ./fcitx5.nix
    ./cli.nix
    ./wezterm.nix
    ./chromium.nix
    ./vim.nix
    ./floorp.nix
  ];
  home = rec {
    username = "hidehic0";
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
