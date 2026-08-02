{ pkgs, ... }: {
  home.packages = with pkgs; [
    colloid-gtk-theme
    nwg-look
  ];
}
