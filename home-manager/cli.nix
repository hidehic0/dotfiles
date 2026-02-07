{ inputs, pkgs, ... }:

let
  acc_utils_pkg = inputs.acc_utils.packages.${pkgs.system}.default;
  tpfl_pkg = inputs.tpfl.packages.${pkgs.system}.default;
  custom_completion_zsh_pkg = inputs.custom-completion-zsh.packages.${pkgs.system}.default;
  prime-generator_pkg = inputs.prime-generator.packages.${pkgs.system}.default;
  binomial_coefficient-calc-cli =
    inputs.binomial_coefficient-calc-cli.packages.${pkgs.system}.default;
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
      grim
      slurp
      uv
      libsixel
      exiftool
    ]
    ++ [
      acc_utils_pkg
      tpfl_pkg
      custom_completion_zsh_pkg
      prime-generator_pkg
      binomial_coefficient-calc-cli
    ];

}
