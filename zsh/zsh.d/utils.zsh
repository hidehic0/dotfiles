#!/bin/zsh
setopt globdots

# zoxide
# eval "$(zoxide init zsh)"

# fzf
export FZF_DEFAULT_OPTS="--ignore-case"

# zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# editor
export EDITOR=nvim

export GPG_TTY=$(tty)

# dirnev
eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=
