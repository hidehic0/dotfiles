# fzfでディレクトリを移動する関数
cfd() {
  local dir
  dir=$(find . -name "*" -type d | fzf)

  cd "$dir"
}

# cdしたら自動でls
# function custom_cd() {
#   \cd $@ && ls
# }
# alias cd='custom_cd'

function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls /$(ghq root)/{}")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^g' ghq-fzf

function ghq-fzf-insert() {
  local src=$(ghq list | fzf --preview "ls /$(ghq root)/{}")
  if [ -n "$src" ]; then
    LBUFFER+="$(ghq root)/$src"
  fi
  zle -R -c
}

zle -N ghq-fzf-insert
bindkey '^h' ghq-fzf-insert
