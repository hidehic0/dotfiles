# Ensure the zsh site-functions directory exists
ZSH_COMPLETIONS_DIR="$HOME/.local/share/zsh/site-functions"
if [ ! -d "$ZSH_COMPLETIONS_DIR" ]; then
  mkdir -p "$ZSH_COMPLETIONS_DIR"
fi

# GitHub CLI (gh)
if [ ! -e "$ZSH_COMPLETIONS_DIR/_gh" ]; then
  gh completion -s zsh >"$ZSH_COMPLETIONS_DIR/_gh"
fi

# jj VCS (uncomment to enable)
# if [ ! -e "$ZSH_COMPLETIONS_DIR/_jj" ]; then
#   jj util completion zsh >"$ZSH_COMPLETIONS_DIR/_jj"
# fi

# aqua
if [ ! -e "$ZSH_COMPLETIONS_DIR/_aqua" ]; then
  aqua completion zsh >"$ZSH_COMPLETIONS_DIR/_aqua"
fi

# sheldon
if [ ! -e "$ZSH_COMPLETIONS_DIR/_sheldon" ]; then
  sheldon completions --shell zsh >"$ZSH_COMPLETIONS_DIR/_sheldon"
fi

# uv
if [ ! -e "$ZSH_COMPLETIONS_DIR/_uv" ]; then
  uv generate-shell-completion zsh >"$ZSH_COMPLETIONS_DIR/_uv"
fi

# mise
if [ ! -e "$ZSH_COMPLETIONS_DIR/_mise" ]; then
  mise completion zsh >"$ZSH_COMPLETIONS_DIR/_mise"
fi
