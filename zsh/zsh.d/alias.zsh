#!/bin/zsh
bin_dir="$HOME/.config/zsh/bin"

# quicktest command
alias qcp="$bin_dir/quicktest.sh"
alias ojtp="$bin_dir/oj_test_python.sh"
alias ojtc="$bin_dir/oj_test_cpp.sh"
alias acs="$bin_dir/atc_submit.zsh"
alias acsp="$bin_dir/acc_submit_python.sh"
alias acsc="$bin_dir/acc_submit_cpp.sh"

# git command alias
alias git_push="$bin_dir/git_commands/push_cur_branch.zsh"
alias git_pull="$bin_dir/git_commands/pull_cur_branch.zsh"

# pacman alias
alias pacman_search="$bin_dir/pacman_search.zsh"

# rank mirrors
alias rank_mirror='curl -s "https://archlinux.org/mirrorlist/?country=JP&country=AU&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 - | wl-copy'

# LSDeluxe alias
alias ls="eza --icons=auto"
alias lsa="eza --icons=auto -a"
alias lsl="eza --icons=auto -l"
alias lsla="eza --icons=auto -la"

# clean cache alias
alias clean_cache="$bin_dir/clean_cache.zsh"
# package update
alias package_update="$bin_dir/package_update.zsh"

# rm and cp
alias rmcp='(){rm $2 && cp $1 $2}'

# cd alias
alias cdr="cd .."
alias cdb="cd -"

# atcoder-cli
atc() {
  acc new $1
  cd $1
}

catc() {
  if [ -d $1 ]; then
    cd $1
  else
    atc $1
  fi
}

alias cat="gat"
