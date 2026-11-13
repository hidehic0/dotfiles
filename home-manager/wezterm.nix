{
  inputs,
  pkgs,
  ...
}:
{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (old: {
      buildInputs = old.buildInputs ++ [
        pkgs.zstd
        pkgs.libgit2
        pkgs.sqlite
      ];
    });
  };
}
