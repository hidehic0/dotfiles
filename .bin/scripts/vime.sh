#!/usr/bin/env bash

# 参考
# https://github.com/yasunori0418/dotfiles/blob/main/home/bin/vime.sh
# https://zenn.dev/vim_jp/articles/20230315_skkeleton

alacritty \
	--option "window.dimensions.columns=120" \
	--option "window.dimensions.lines=30" \
	--option "window.decorations='FULL'" \
	--option "font.normal.family='FiraCode Nerd Font'" \
	--option "font.size=13" \
	--class VimIme \
	--title VimIme \
	--command nvim /tmp/clip || exit 1

if [[ -e /tmp/clip ]]; then
	head -c -1 /tmp/clip | wl-copy
	notify-send --hint=string:desktop-entry:nvim -t 1000 "VIME: copied" -e
	rm /tmp/clip
fi
