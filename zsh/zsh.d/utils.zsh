# compinit
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

# zoxide
eval "$(zoxide init zsh)"

# fzf
export FZF_DEFAULT_OPTS="--ignore-case"

# github cli
if [ ! -f "$HOME/.local/lib/zsh/gh_comp.zsh" ]; then
  gh completion -s zsh >>~/.local/lib/zsh/gh_comp.zsh
fi

source "$HOME/.local/lib/zsh/gh_comp.zsh"

# jj vcs
if [ ! -f "$HOME/.local/lib/zsh/jj_comp.zsh" ]; then
  jj util completion zsh >>~/.local/lib/zsh/jj_comp.zsh
fi

source "$HOME/.local/lib/zsh/gh_comp.zsh"
