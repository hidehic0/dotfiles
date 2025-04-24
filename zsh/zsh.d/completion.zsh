# github cli
if [ ! -e $HOME/.local/lib/zsh/gh_comp.zsh ]; then
  gh completion -s zsh >~/.local/lib/zsh/gh_comp.zsh
fi

zsh-defer source "$HOME/.local/lib/zsh/gh_comp.zsh"

# jj vcs
if [ ! -e $HOME/.local/lib/zsh/jj_comp.zsh ]; then
  jj util completion zsh >~/.local/lib/zsh/jj_comp.zsh
fi

zsh-defer source "$HOME/.local/lib/zsh/jj_comp.zsh"

# aqua
if [ ! -e $HOME/.local/lib/zsh/aqua_comp.zsh ]; then
  aqua completion zsh >~/.local/lib/zsh/aqua_comp.zsh
fi
zsh-defer source "$HOME/.local/lib/zsh/aqua_comp.zsh"

# sheldon
if [ ! -e $HOME/.local/lib/zsh/sheldon_comp.zsh ]; then
  sheldon completions --shell zsh >~/.local/lib/zsh/sheldon_comp.zsh
fi

zsh-defer source "$HOME/.local/lib/zsh/sheldon_comp.zsh"

# uv
if [ ! -e $HOME/.local/lib/zsh/uv_comp.zsh ]; then
  uv generate-shell-completion zsh >~/.local/lib/zsh/uv_comp.zsh
fi

zsh-defer source "$HOME/.local/lib/zsh/uv_comp.zsh"
