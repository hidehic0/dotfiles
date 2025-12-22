{pkgs, ...}: {
  home.packages = with pkgs; [
    sheldon
    fzf
    eza
  ];
}
