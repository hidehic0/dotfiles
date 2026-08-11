{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bitwarden-desktop
    alacritty
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

    kdePackages.okular
  ];
}
