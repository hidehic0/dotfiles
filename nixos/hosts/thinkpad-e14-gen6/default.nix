{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    # ../../configuration.nix

    ../../modules/bootloader.nix
    ../../modules/nix.nix
    ../../modules/locale.nix
    ../../modules/fonts.nix
    ../../modules/network.nix
    ../../modules/sound.nix
    ../../modules/printer.nix
    ../../modules/power_profile.nix
    ../../modules/zsh.nix
    ../../modules/direnv.nix
    ../../modules/gdm.nix
    ../../modules/hyprland.nix
    ../../modules/systempackage.nix
    ../../modules/gnupg.nix
  ];

  users.users.hidehic0 = {
    isNormalUser = true;
    description = "hidehic0";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
