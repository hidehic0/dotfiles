{pkgs, ...}:
{
  home.packages = with pkgs; [
    neovim
    deno
    ripgrep
    lua-language-server
    efm-langserver
    tombi
    pyright
    shellcheck
    actionlint
    eslint
    shfmt
    jq
    tree-sitter
  ];
}
