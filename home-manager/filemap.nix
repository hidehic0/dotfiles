{ config, ... }:
let
  symlink = config.lib.file.mkOutOfStoreSymlink;
  path = "${config.home.homeDirectory}/.dotfiles";
in
{
  home.file = {
    ".zshrc".source = symlink "${path}/zsh/zshrc";
    ".config/sheldon" = {
      source = symlink "${path}/sheldon";
    };
    ".config/lazygit" = {
      source = symlink "${path}/lazygit";
    };
    ".config/nvim" = {
      source = symlink "${path}/nvim";
    };
    ".config/ghostty".source = symlink "${path}/ghostty";
    ".config/wezterm".source = symlink "${path}/wezterm";
    ".config/hypr/hyprland.conf".source = symlink "${path}/hypr/hyprland.conf";
    ".config/hypr/hyprsunset.conf".source = symlink "${path}/hypr/hyprsunset.conf";
    ".config/hypr/hypridle.conf".source = symlink "${path}/hypr/hypridle.conf";
    ".config/waybar".source = symlink "${path}/waybar";
    ".config/gtk-3.0".source = symlink "${path}/gtk-3.0";
    ".config/gtk-4.0".source = symlink "${path}/gtk-4.0";
    ".config/swaync".source = symlink "${path}/swaync";
    ".config/libskk".source = symlink "${path}/libskk";
    ".config/fcitx5".source = symlink "${path}/fcitx5";
    ".config/direnv".source = symlink "${path}/direnv";
    ".config/custom-completion-zsh".source = symlink "${path}/custom-completion-zsh";
    ".config/tpfl".source = symlink "${path}/tpfl";
    ".clangd".source = symlink "${path}/clangd/config.yml";
  };
}
