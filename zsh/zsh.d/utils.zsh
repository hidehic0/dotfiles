#!/bin/zsh
setopt globdots

zstyle ':completion::complete:*' gain-privileges 1
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' fzf-preview 'echo {}'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always $realpath'

# zoxide
eval "$(zoxide init zsh)"

# fzf
export FZF_DEFAULT_OPTS="--ignore-case"

# zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
