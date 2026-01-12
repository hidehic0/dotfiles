{ pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Nix Config
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://wezterm.cachix.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  # nix-ld
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    glibc
    zlib
    openssl
    stdenv.cc.cc
  ];
}
