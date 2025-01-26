# fzfでディレクトリを移動する関数
cfd() {
  local dir
  dir=$(find . -name "*" -type d | fzf)

  cd "$dir"
}

# cdしたら自動でls
function custom_cd() {
  \cd $@ && ls
}
alias cd='custom_cd'
