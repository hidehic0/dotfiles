{ ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.displayManager.gdm.enable = true;
}
