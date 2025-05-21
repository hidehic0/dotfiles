if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH ~/.local/share/aquaproj-aqua/bin $PATH
set -x AQUA_GLOBAL_CONFIG $HOME/.config/aqua.yaml
mise activate fish | source

set -x MOCWORD_DATA ~/.local/lib/mocword/mocword.sqlite

set -Ux fifc_editor nvim

alias ls="lsd"
