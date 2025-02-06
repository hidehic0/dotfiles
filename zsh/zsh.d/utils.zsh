# compinit
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# zoxide
eval "$(zoxide init zsh)"

# fzf
export FZF_DEFAULT_OPTS="--ignore-case"
