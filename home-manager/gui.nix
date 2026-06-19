{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    ghostty
    pcmanfm
    discord-ptb
    obsidian
    gnome-clocks
    gnome-pomodoro
    anki
    easyeffects
    pinta
    safeeyes
    vivaldi
  ];
}
