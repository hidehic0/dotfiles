{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-skk
      fcitx5-gtk
      libsForQt5.fcitx5-qt
      catppuccin-fcitx5

    ];
  };
  home.packages = with pkgs; [
    yaskkserv2
  ];
  systemd.user.services.yaskkserv2 = {
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.yaskkserv2}/bin/yaskkserv2 ${pkgs.yaskkserv2}/share/dictionary.yaskkserv2";
      RemainAfterExit = "yes";
    };
  };
}
