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
