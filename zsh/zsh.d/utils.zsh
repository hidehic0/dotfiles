# compinit
# autoload -Uz compinit
# compinit

# zstyle ':completion:*' menu-select true
zstyle ':completion::complete:*' gain-privileges 1
# zstyle ':completion:*:default' menu 'select'
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' fzf-preview 'echo {}'

# zoxide
eval "$(zoxide init zsh)"

# fzf
export FZF_DEFAULT_OPTS="--ignore-case"

# github cli
if [ ! -e "$HOME/.local/lib/zsh/gh_comp.zsh" ]; then
  gh completion -s zsh >~/.local/lib/zsh/gh_comp.zsh
fi

source "$HOME/.local/lib/zsh/gh_comp.zsh"

# jj vcs
if [ ! -e "$HOME/.local/lib/zsh/jj_comp.zsh" ]; then
  jj util completion zsh >~/.local/lib/zsh/jj_comp.zsh
fi

source "$HOME/.local/lib/zsh/jj_comp.zsh"

# aqua
if [ ! -e "$HOME/.local/lib/zsh/aqua_comp.zsh" ]; then
  aqua completion zsh >~/.local/lib/zsh/aqua_comp.zsh
fi
source "$HOME/.local/lib/zsh/aqua_comp.zsh"

# mise
eval "$(mise activate zsh)"

# sheldon
if [ ! -e "$HOME/.local/lib/zsh/sheldon_comp.zsh" ]; then
  sheldon completions --shell zsh >~/.local/lib/zsh/sheldon_comp.zsh
fi

source "$HOME/.local/lib/zsh/sheldon_comp.zsh"
