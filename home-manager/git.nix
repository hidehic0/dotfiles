{pkgs, ...}:{
  programs.git = {
    enable = true;
    settings = {
    user.name = "hidehic0";
    user.email = "hidehico.ooba@gmail.com";
    core = {
      editor = "nvim";
    };
    init.defaultBranch = "main";
    };

  };
}
