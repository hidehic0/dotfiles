{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    ghostty
    pcmanfm
    vivaldi
    discord
    obsidian
  ];
}
