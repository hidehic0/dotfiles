{pkgs, ...}: {
  imports = [ ./filemap.nix ./gui.nix ./git.nix ];
  home = rec {
    username = "hidehic0";
    homeDirectory = "/home/${username}";
    stateVersion="25.11";
  };

  programs.home-manager.enable = true;
}
