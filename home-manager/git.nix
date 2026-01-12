{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "hidehic0";
        email = "hidehico.ooba@gmail.com";
        signingkey = "BA9DAF222569440E";
      };
      core = {
        editor = "nvim";
        pager = "delta";
        excludesfile = "~/.dotfiles/git/ignore";
      };
      commit = {
        gpgsign = true;
      };
      tag = {
        gpgSign = true;
      };
      init.defaultBranch = "main";
      parger = {
        diff = "delta";
        show = "delta";
        log = "delta";
      };
      interactive.diffFilter = "delta --color-only";
      delta = {
        navigate = "true";
        dark = "true";
        side-by-side = "true";
        line-numbers = "true";
      };
      merge.conflictstyle = "zdiff3";
      push.autoSetupRemote = "true";
      ghq.root = "~/src";
      alias = {
        sync = "!zsh -i -c git-sync";
      };
    };
  };

  home.packages = with pkgs; [
    lazygit
    gh
    delta
    ghq
  ];
}
