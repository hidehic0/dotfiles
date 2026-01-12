{ config, ... }:
{
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Tailscale
  services.tailscale.enable = true;

  # FireWall
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };
}
