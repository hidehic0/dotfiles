# powerlevel10kの初期設定
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 履歴の設定
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000000

# sheldonの設定
eval "$(sheldon source)"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# powerlevel10kのセットアップ
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 補完で選んでいるところを色付ける設定
zstyle ':completion:*' menu true
zstyle ':completion:*:rm:*' menu false

# fzfでディレクトリを移動する関数
cfd() {
  local dir
  dir=$(find . -name "*" -type d | fzf)
  
  cd "$dir"
}

# alias
alias dark_nvim='NVIM_APPNAME=dark_nvim nvim'

# rust path
. "$HOME/.cargo/env"

# pypy path
alias pypy3="$HOME/pypy3.10-v7.3.17-linux64/bin/pypy3"

# quicktest command
alias qcp="$HOME/bin/quicktest.sh"

# rank mirrors
alias rank_mirror='curl -s "https://archlinux.org/mirrorlist/?country=JP&country=AU&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 - | wl-copy'
