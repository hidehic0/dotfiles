# rust path
. "$HOME/.cargo/env"

# fpath
fpath=(/home/hidehico/.local/share/sheldon/repos/github.com/zsh-users/zsh-completions/src $fpath)

# mise path
eval "$(/home/hidehico/.nix-profile/bin/mise activate zsh)"

# go path
GOPATH="$HOME/go"
PATH="$PATH:$GOPATH/bin"
