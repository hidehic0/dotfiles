{ inputs, pkgs, ... }:

let
  acc_utils_pkg = inputs.acc_utils.packages.${pkgs.system}.default;
  tpfl_pkg = inputs.tpfl.packages.${pkgs.system}.default;
  custom_completion_zsh_pkg = inputs.custom-completion-zsh.packages.${pkgs.system}.default;
in
{
  home.packages =
    with pkgs;
    [
      # btop
      fd
      python314
      rust-bin.stable.latest.default
      nodejs_25
      clang-tools
      ac-library
      fastfetch
    ]
    ++ [
      acc_utils_pkg
      tpfl_pkg
      custom_completion_zsh_pkg
    ];

}
