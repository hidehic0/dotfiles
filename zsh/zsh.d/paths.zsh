# rust path
. "$HOME/.cargo/env"
PATH="$PATH:$HOME/.cargo/bin"

# fpath
fpath=(/home/hidehico/.local/share/sheldon/repos/github.com/zsh-users/zsh-completions/src $fpath)

# mise path
if [ ! -e $HOME/.local/lib/zsh/mise_active.zsh ]; then
	mise activate zsh >~/.local/lib/zsh/mise_active.zsh
fi

zsh-defer source "$HOME/.local/lib/zsh/mise_active.zsh"

# go path
# GOPATH="$HOME/go"
# PATH="$PATH:$GOPATH/bin"

export MOCWORD_DATA=~/.local/lib/mocword/mocword.sqlite

# aqua
export AQUA_GLOBAL_CONFIG=$HOME/.dotfiles/aqua.yaml
export PATH="$PATH:$HOME/.local/share/aquaproj-aqua/bin"
export AQUA_PROGRESS_BAR=true
