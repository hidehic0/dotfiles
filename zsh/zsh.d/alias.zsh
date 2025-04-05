bin_dir="$HOME/.config/zsh/bin"

# quicktest command
alias qcp="$bin_dir/quicktest.sh"
alias ojtp="$bin_dir/oj_test_python.sh"
alias ojtc="$bin_dir/oj_test_cpp.sh"
alias acsp="$bin_dir/acc_submit_python.sh"
alias acsc="$bin_dir/acc_submit_cpp.sh"

# git command alias
alias git_push="$bin_dir/git_commands/push_cur_branch.zsh"
alias git_pull="$bin_dir/git_commands/pull_cur_branch.zsh"

# rank mirrors
alias rank_mirror='curl -s "https://archlinux.org/mirrorlist/?country=JP&country=AU&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 - | wl-copy'

# LSDeluxe alias
alias ls="lsd"
alias lsa="lsd -a"
alias lsl="lsd -l"
alias lsla="lsd -la"

# clean cache alias
alias clean_cache="$bin_dir/clean_cache.zsh"
# package update
alias package_update="$bin_dir/package_update.zsh"

# rm and cp
alias rmcp='(){rm $2 && cp $1 $2}'

# cd alias
alias cdp="cd .."
alias cdb="cd -"
