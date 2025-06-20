#!/bin/bash

paru -S fcitx5-im fcitx5-qt fcitx5-gtk fcitx5-configtool
paru -S fcitx5-skk yaskkserv2-bin rust

cd /tmp
git clone https://github.com/wachikun/yaskkserv2.git
cd yaskkserv2
cargo build --release
sudo cp -av target/release/yaskkserv2 /sbin/
sudo cp -av target/release/yaskkserv2_make_dictionary /sbin/

wget https://raw.githubusercontent.com/uasi/skk-emoji-jisyo/master/SKK-JISYO.emoji.utf8
sudo mv SKK-JISYO.emoji.utf8 /usr/share/skk/
cd ..
rm -rf yaskkserv2

mkdir -p $HOME/.local/lib/yaskkserv2/
sudo yaskkserv2_make_dictionary --dictionary-filename=/usr/local/share/dictionary.yaskkserv2 /usr/share/skk/SKK-JISYO.L /usr/share/skk/SKK-JISYO.jinmei /usr/share/skk/SKK-JISYO.fullname /usr/share/skk/SKK-JISYO.geo /usr/share/skk/SKK-JISYO.propernoun /usr/share/skk/SKK-JISYO.station

mkdir -p $HOME/.local/share/fcitx5/skk
echo "type=file,file=~/.local/share/fcitx5/skk/user.dict,mode=readwrite,complete=true\nfile=/usr/share/skk/SKK-JISYO.emoji.utf8,mode=readonly,type=file\ntype=server,host=localhost,port=1178" >$HOME/.local/share/fcitx5/skk/dictionary_list
