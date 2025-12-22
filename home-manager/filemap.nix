{config, ...}:let
  symlink= config.lib.file.mkOutOfStoreSymlink;
  path = "${config.home.homeDirectory}/.dotfiles";
in{
  home.file = {
    ".zshrc".source =  symlink "${path}/zsh/zshrc";
    ".config/sheldon" = {
      source = symlink "${path}/sheldon";
    };
  };
}
