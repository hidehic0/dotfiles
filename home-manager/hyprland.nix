{ pkgs, lib, ... }:
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

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$terminal" = "wezterm";
      "$fileManager" = "pcmanfm";
      "$menu" = "rofi -combi-modi window,drun,ssh -show combi";
      "$browser" = "vivaldi";

      monitor = [
        "DP-1,3840x2160@60,auto,1.33"
        "eDP-1,highrr,auto,1,mirror,DP-1"
      ];

      exec-once = [
        "systemctl --user start xdg-desktop-portal-gtk.service"
        "fcitx5 -d"
        "waybar"
        "swaync"
        "swayosd-server"
        "hypridle"
        "hyprpaper"
        "hyprsunset"

        "[workspace 1 silent] $browser"
        "[workspace 2 silent] $terminal"
        "[workspace 4 silent] discord --ozone-platform=x11"
      ]
      ++
        builtins.concatMap
          (type: [
            "wl-paste --type ${type} --watch cliphist store"
          ])
          [
            "text"
            "image"
          ];

      env = lib.mapAttrsToList (name: value: "${name},${toString value}") {
        # session type
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_RUNTIME_DIR = "/run/user/1000";

        # xcursor
        XCURSOR_SIZE = 24;
        XCURSOR_THEME = "Adwaita";

        # wayland
        ELECTRON_OZONE_PLATFORM_HINT = "x11";
        MOZ_ENABLE_WAYLAND = 1;
        WLR_NO_HARDWARE_CURSORS = 1;

        # fcitx
        QT_IM_MODULE = "fcitx";
        GTK_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
        SDL_IM_MODULE = "fcitx";
        INPUT_METHOD = "fcitx";

        GDK_SCALE = "1";
        QT_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "wayland";
      };

      # animetion and design
      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {

        gaps_in = 1;
        gaps_out = 1;

        border_size = 2;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "rgba(5e81accc) rgba(4c566acc) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        # layout = hy3

        # snap
        snap = {
          enabled = false;
        };
      };

      decoration = {
        rounding = "20";

        blur = {
          enabled = "true";
          size = "3";
          passes = "3";

          # vibrancy = 0.1696
        };
      };

      animations = {

        enabled = "yes, please :)";

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      # layout

      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      };

      # input
      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {

        kb_layout = "jp";
        kb_variant = "";
        kb_model = "";
        kb_options = "ctrl:nocaps";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = true;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gesture = "4, horizontal, workspace";

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device = {
        name = "epic-mouse-v1";
        sensitivity = "-0.5";
      };

      # keybind
      # See https://wiki.hyprland.org/Configuring/Keywords/
      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, F2, exec, vivaldi --disable-gpu"
        "$mainMod, F3, exec, $fileManager"
        "$mainMod, d, exec, $menu"

        "$mainMod, V, togglefloating,"

        # hyprlock
        "$mainMod, comma, exec, hyprlock"

        #  kill app
        "$mainMod+SHIFT, q, killactive"

        # move fucus
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # window move
        "SUPER+SHIFT,h,movewindow,l"
        "SUPER+SHIFT,l,movewindow,r"
        "SUPER+SHIFT,k,movewindow,u"
        "SUPER+SHIFT,j,movewindow,d"
      ]
      ++
        builtins.concatMap
          (ind: [ "$mainMod, ${toString (if ind == 10 then 0 else ind)}, workspace, ${toString ind}" ])
          [
            1
            2
            3
            4
            5
            6
            7
            8
            9
            10
          ]

      ++
        builtins.concatMap
          (ind: [
            "$mainMod CTRL, ${toString (if ind == 10 then 0 else ind)}, movetoworkspace, ${toString ind}"
          ])
          [
            1
            2
            3
            4
            5
            6
            7
            8
            9
            10
          ];

      bindm = [
        # resize window
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindl = [
        # playerctl
        ",XF86AudioNext, exec, swayosd-client --playerctl next"
        ",XF86AudioPause, exec, swayosd-client --playerctl pause"
        ",XF86AudioPlay, exec, swayosd-client --playerctl play"
        ",XF86AudioPrev, exec, swayosd-client --playerctl prev"
      ];
      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, swayosd-client --output-volume=raise"
        ",XF86AudioLowerVolume, exec, swayosd-client --output-volume=lower"
        ",XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        ",XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"
        ",XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
        ",XF86MonBrightnessDown, exec, swayosd-client --brightness lower"
      ];

      # window rules
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
      windowrule = [
        "suppress_event maximize, match:class .*"

        # xwayland
        {
          name = "fix-xwayland-drags";
          "match:class" = "^$";
          "match:title" = "^$";
          "match:xwayland" = "true";
          "match:float" = "true";
          "match:fullscreen" = "false";
          "match:pin" = "false";

          no_focus = "true";
        }

        "match:float yes, match:class vivaldi-stable, match:title Bitwarden - Vivaldi"

        # 透明度
        "opacity 0.7, match:class com.mitchellh.ghostty"
        "opacity 0.7, match:class obsidian"
        "opacity 0.9, match:class discord"
      ];

      # xwayland
      xwayland = {
        enabled = true;
        force_zero_scaling = true;
      };
    };
  };

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
