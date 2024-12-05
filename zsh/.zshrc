# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000


source /home/hidehico/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath=(/home/hidehico/zsh-completions/src $fpath)
eval "$(gh completion -s zsh)"
# Set up fzf key bindings and fuzzy completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# functions
fd() {
    # 引数があればその名前でディレクトリを検索
    find . -name "${1:-*}" -type d | fzf
}

cfd() {
    # fd() の結果を変数に格納してチェック
    selected_dir=$(fd "$1")
    if [[ -n "$selected_dir" ]]; then
        cd "$selected_dir" || echo "ディレクトリに移動できません: $selected_dir"
    else
        echo "ディレクトリが選択されませんでした"
    fi
}

# path config
# export PATH="$PATH:/opt/nvim-linux64/bin"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
 source $HOME/.cargo/env
export PATH="$PATH:/opt/lua-language-server/bin"
export PATH="$PATH:/opt/pypy3.10-v7.3.17-linux64/bin"
export PATH="$HOME/.local/bin:$PATH"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



. "$HOME/.cargo/env"
. "/home/hidehico/.deno/env"
