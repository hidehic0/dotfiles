{ ... }:
{
  location.provider = "geoclue2";
  # Enable Geoclue
  services.geoclue2 = {
    enable = true;
    enableDemoAgent = true;
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
