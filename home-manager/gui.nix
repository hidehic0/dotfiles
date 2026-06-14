{ pkgs, ... }:
let
  vivaldi_snapshot_4063-3 = pkgs.vivaldi.overrideDerivation (
    dir:
    let
      version = "8.0.4033.44";
    in
    {
      inherit version;
      name = "vivaldi-snapshot-${version}";
      src = pkgs.fetchurl {
        url = "https://downloads.vivaldi.com/stable/vivaldi-stable_${version}-1_amd64.deb";
        hash = "sha256-KzDaOntRz8DOcWX5+GhMyGAr+FIh2RC3S6JEIGaBQfE=";
      };
    }
  );
in
{
  home.packages =
    with pkgs;
    [
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
    ]
    ++ [ vivaldi_snapshot_4063-3 ];
}
