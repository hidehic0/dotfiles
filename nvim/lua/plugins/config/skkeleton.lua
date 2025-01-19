vim.fn["skkeleton#initialize"]()
vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-enable)")
vim.fn["skkeleton#config"]({
  globalDictionaries = {
    "/usr/share/skk/SKK-JISYO.L",
    "/usr/share/skk/SKK-JISYO.geo",
    "/usr/share/skk/SKK-JISYO.fullname",
    "/usr/share/skk/SKK-JISYO.jinmei",
    "/usr/share/skk/SKK-JISYO.propernoun",
  },
  completionRankFile = "~/.cache/skkeleton/rank.json",
})
