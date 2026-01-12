{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    deno
    ripgrep
    lua-language-server
    efm-langserver
    tombi
    shellcheck
    actionlint
    eslint
    shfmt
    jq
    tree-sitter
    ty
    nil
    yaml-language-server
    rust-analyzer
    gopls
    stylua
    ruff
  ];
}
