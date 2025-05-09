#!/bin/zsh

pacman -Sl | fzf --preview 'pacman -Si $(echo {} | cut -d" " -f2)'
