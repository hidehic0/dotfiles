#!/bin/zsh

zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' menu select

# zeno
# export ZENO_ENABLE_SOCK=1
# export ZENO_GIT_CAT="gat"
# export ZENO_GIT_TREE="eza --icons=always -T"
#
# bindkey ' ' zeno-auto-snippet
# bindkey '^i' zeno-completion
# bindkey '^g' zeno-ghq-cd
# bindkey '^x' zeno-insert-snippet

# zoxide
# eval "$(zoxide init zsh)"

# fzf
export FZF_DEFAULT_OPTS="--ignore-case"

# zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# editor
export EDITOR=nvim
