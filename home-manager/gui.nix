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
    vivaldi

    kdePackages.okular
  ];
}
