{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waybar
    pavucontrol
    swayosd
    swaynotificationcenter
    wl-clipboard
    cliphist
    rofi
    hyprsunset
    hypridle
    wlogout
    hyprpaper
  ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    wallpaper {
      monitor = eDP-1
      path = ${pkgs.nixos-artwork.wallpapers.catppuccin-mocha}/share/backgrounds/nixos/nixos-wallpaper-catppuccin-mocha.png
      fit_mode=cover
    }
    wallpaper {
      monitor = DP-1
      path = ${pkgs.nixos-artwork.wallpapers.catppuccin-mocha}/share/backgrounds/nixos/nixos-wallpaper-catppuccin-mocha.png
      fit_mode=cover
    }
  '';
  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = {
        monitor = "";
        outline_thickness = 3;
        inner_color = "rgba(0, 0, 0, 0.0)";
        outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
        fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";
        font_color = "rgb(143, 143, 143)";
        fade_on_empty = false;
        rounding = 15;
        position = "0, -20";
        halign = "center";
        valign = "center";
      };
      background = {
        path = "${pkgs.nixos-artwork.wallpapers.catppuccin-mocha}/share/backgrounds/nixos/nixos-wallpaper-catppuccin-mocha.png";
        color = "rgba(25, 20, 20, 1.0)";
        blur_passes = 2;
      };
      label = [
        {
          text = ''cmd[update:1000] echo "<span>$(date +"%Y/%m/%d(%a) %H:%M")</span>"'';
          font_size = 20;
          position = "0, 190";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
