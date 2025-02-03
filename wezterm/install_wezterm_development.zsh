#!/bin/zsh

wget https://github.com/wez/wezterm/releases/download/nightly/WezTerm-nightly-Ubuntu20.04.AppImage
chmod +x WezTerm-nightly-Ubuntu20.04.AppImage

sudo mv WezTerm-nightly-Ubuntu20.04.AppImage /usr/local/bin/wezterm
