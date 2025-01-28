# compinit
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# zoxide
eval "$(zoxide init zsh)"
