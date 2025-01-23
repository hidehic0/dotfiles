# compinit
autoload -Uz compinit
compinit
zmodload zsh/zpty

zstyle ':completion:*' menu select

# zoxide
eval "$(zoxide init zsh)"
