# rust path
. "$HOME/.cargo/env"
PATH="$PATH:$HOME/.cargo/bin"

# fpath
fpath=(/home/hidehico/.local/share/sheldon/repos/github.com/zsh-users/zsh-completions/src $fpath)

# mise path
eval "$(mise activate zsh)"

# go path
GOPATH="$HOME/go"
PATH="$PATH:$GOPATH/bin"

export MOCWORD_DATA=~/.local/lib/mocword/mocword.sqlite

# aqua
export PATH="$PATH:$HOME/.local/share/aquaproj-aqua/bin"
export AQUA_GLOBAL_CONFIG=$HOME/.config/aqua.yaml
