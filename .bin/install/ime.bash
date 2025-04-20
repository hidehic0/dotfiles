#!/bin/bash

paru -S fcitx5-im fcitx5-qt fcitx5-gtk fcitx5-configtool
paru -S fcitx5-skk yaskkserv2-bin

mkdir -p $HOME/.local/lib/yaskkserv2/
sudo yaskkserv2_make_dictionary --dictionary-filename=/usr/local/share/dictionary.yaskkserv2 /usr/share/skk/SKK-JISYO.L /usr/share/skk/SKK-JISYO.jinmei /usr/share/skk/SKK-JISYO.fullname /usr/share/skk/SKK-JISYO.geo /usr/share/skk/SKK-JISYO.propernoun /usr/share/skk/SKK-JISYO.station

mkdir -p $HOME/.local/share/fcitx5/skk
echo "type=file,file=$FCITX_CONFIG_DIR/skk/user.dict,mode=readwrite,complete=true\ntype=server,host=localhost,port=1178" >$HOME/.local/share/fcitx5/skk/dictionary_list
