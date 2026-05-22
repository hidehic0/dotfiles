{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    ghostty
    pcmanfm
    vivaldi
    discord
    obsidian
    gnome-clocks
    gnome-pomodoro
    anki
    easyeffects
  ];
}
