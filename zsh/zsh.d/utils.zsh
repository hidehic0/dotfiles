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

# ssh
export SSH_AUTH_SOCK=~/.bitwarden-ssh-agent.sock

# completion
# zstyle ':completion:*' menu select
# zstyle ':completion::complete:*' gain-privileges 1
# bindkey "\e[Z" reverse-menu-complete

# zeno
# bindkey ' ' zeno-auto-snippet
# bindkey '^i' zeno-completion
# bindkey '^m' zeno-auto-snippet-and-accept-line
#
# bindkey '^xx' zeno-insert-snippet # open snippet picker (fzf) and insert at cursor
# bindkey '^x ' zeno-insert-space
# bindkey '^x^m' accept-line
#
# bindkey '^r' zeno-history-selection
