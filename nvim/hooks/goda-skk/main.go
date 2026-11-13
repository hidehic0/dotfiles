package main

import (
	"github.com/Shougo/goda-skk.vim/dictionary/skkserv"
	"github.com/Shougo/goda-skk.vim/engine"
	azik_kanatable "github.com/hidehic0/skkeleton-azik-kanatable/godaskk"
)

func main() {
	engine.Main(engine.Config{
		Dictionaries: []engine.Dictionary{
			skkserv.New(skkserv.Params{Addr: "localhost:1178"}),
		},

		UserDictionary: "~/.local/share/fcitx5/skk/user.dict",

		KanaTable: engine.RomTable.With(
			azik_kanatable.Rules()...,
		),
		Keymaps: map[string]map[string]string{
			"input": {"@": "katakana", "/": "abbrev", "'": "hankata", "l": "disable", "<C-j>": "hirakana"},
		},
	})

}
