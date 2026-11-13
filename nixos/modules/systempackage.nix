{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    neovim
    git
    gcc15
    wget
    brightnessctl
    btop
    unzip
    boost
    ac-library
    nvd
    gnumake
    adwaita-icon-theme
    bubblewrap
    libnotify
    qpdf
    (safeeyes.overridePythonAttrs (
      finalAttrs: old: {
        # pname = "safeeyes";
        version = "3.5.1";
        src = fetchPypi {
          inherit (old) pname;
          inherit (finalAttrs) version;
          hash = "sha256-tuU2uWEi/7Tcmjb7ogAs0+HqfpwUU9q1SUnhX5US8I4=";
        };
        dependencies = old.dependencies ++ [
          python3Packages.pywayland
          python3Packages.croniter
        ];
      }
    ))
  ];

  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
    remotePlay.openFirewall = true;
  };

}
