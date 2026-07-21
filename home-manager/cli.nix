{
  inputs,
  pkgs,
  ...
}:

let
  acc_utils_pkg = inputs.acc_utils.packages.${pkgs.stdenv.hostPlatform.system}.default;
  tpfl_pkg = inputs.tpfl.packages.${pkgs.stdenv.hostPlatform.system}.default;
  custom_completion_zsh_pkg =
    inputs.custom-completion-zsh.packages.${pkgs.stdenv.hostPlatform.system}.default;
  prime-generator_pkg = inputs.prime-generator.packages.${pkgs.stdenv.hostPlatform.system}.default;
  binomial_coefficient-calc-cli =
    inputs.binomial_coefficient-calc-cli.packages.${pkgs.stdenv.hostPlatform.system}.default;
  ghtkn = pkgs.callPackage ../my-nix-packages/ghtkn/default.nix { };
in
{
  home.packages =
    with pkgs;
    [
      # btop
      fd
      python314
      rust-bin.stable.latest.default
      nodejs_latest
      llvmPackages_22.clang-tools
      ac-library
      fastfetch
      grim
      slurp
      uv
      libsixel
      exiftool
      cbonsai
      cmatrix
      handlr
      universal-ctags
      renovate
      jdenticon-cli
      bulletty
      codex
      bubblewrap

      typst
      tinymist

      websocat

      github-copilot-cli
    ]
    ++ [
      acc_utils_pkg
      tpfl_pkg
      custom_completion_zsh_pkg
      prime-generator_pkg
      binomial_coefficient-calc-cli
      ghtkn
    ];
}
