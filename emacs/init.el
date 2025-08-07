(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "$HOME/.local/share/aquaproj-aqua/bin")))
(setenv "AQUA_GLOBAL_CONFIG" "$HOME/.dotfiles/aqua.yaml")
(add-to-list 'exec-path (expand-file-name "~/.local/share/aquaproj-aqua/bin"))
