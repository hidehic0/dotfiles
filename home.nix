{ config, pkgs, ... }: {
  home.username = "hidehic0";
  home.homeDirectory = "/home/hidehic0";
  home.stateVersion = "25.11"; # 適切なバージョンに設定

    home.packages = with pkgs; [
    ripgrep
      mise
    ];

  home.file = {
    ".config/zsh/zsh.d" = {
      source = ./zsh/zsh.d;
      recursive = true;
    };
  };



  programs.home-manager.enable = true;
  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux/tmux.conf;
    plugins = with pkgs; [
    {plugin = tmuxPlugins.nord;}
    ];
  };
  programs.git = {
    enable = true;
    userName = "hidehic0";
    userEmail = "hidehico.ooba@gmail.com";
    extraConfig = {
      user.signingkey = "BA9DAF222569440E";
      init.defaultBranch = "main";
      core = {
        pager = "delta";
        editor = "nvim";
      };
      pager = {
        diff = "delta";
        show = "delta";
        log = "delta";
      };
      interactive.diffFilter = "delta --color-only";
      delta = {
        navigate = true;
        dark = true;
        side-by-side =true;
        line-numbers = true;
      };
      merge.conflictstyle = "zdiff3";
      commit.gpgsign = true;
      tag.gpgsign = true;
      push.autoSetupRemote = true;
      alias = {
        sync = "!zsh -i -c git-sync";
        discard = "!git restore --source=HEAD --staged --worktree . && git clean -f && echo 'All changes discarded.'";
      };
      ghq.root = "~/src";
    };
  };
}
