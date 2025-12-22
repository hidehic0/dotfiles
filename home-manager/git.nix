{pkgs, ...}:{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "hidehic0";
        email = "hidehico.ooba@gmail.com";
      };
      core = {
        editor = "nvim";
	pager = "delta";
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
    };
  };

  home.packages = with pkgs; [
    lazygit
    gh
    delta
    ghq
  ];
}
