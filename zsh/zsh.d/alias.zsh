bin_dir="/home/hidehico/.config/zsh/bin"
# pypy path
alias pypy3="$HOME/pypy3.10-v7.3.17-linux64/bin/pypy3"

# quicktest command
alias qcp="$bin_dir/quicktest.sh"
alias ojtp="$bin_dir/oj_test_python.sh"
alias ojtc="$bin_dir/oj_test_cpp.sh"
alias acsp="$bin_dir/acc_submit_python.sh"
alias acsc="$bin_dir/acc_submit_cpp.sh"

# rank mirrors
alias rank_mirror='curl -s "https://archlinux.org/mirrorlist/?country=JP&country=AU&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 - | wl-copy'

# LSDeluxe alias
alias ls="lsd"
alias lsa="lsd -a"
alias lsl="lsd -l"
alias lsla="lsd -la"
