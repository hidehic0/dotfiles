{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --cmd start-hyprland";
        user = "hidehic0";
      };
    };
  };
}
