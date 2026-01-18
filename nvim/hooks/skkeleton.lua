-- lua_source {{{
vim.fn["skkeleton#initialize"]()
vim.keymap.set({ "i", "c" }, "<C-j>", "<Plug>(skkeleton-enable)")
vim.fn["skkeleton#azik#add_table"]("jis")

vim.fn["skkeleton#config"]({
  globalDictionaries = {
    "~/.local/share/fcitx5/skk/user.dict",
  },
  sources = { "skk_server", "skk_dictionary" },
  completionRankFile = "~/.cache/skkeleton/rank.json",
  kanaTable = "azik",
})
-- }}}
