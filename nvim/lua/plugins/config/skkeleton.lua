vim.fn["skkeleton#initialize"]()
vim.keymap.set({ "i", "c" }, "<C-j>", "<Plug>(skkeleton-enable)")

vim.fn["skkeleton#config"]({
  globalDictionaries = {
    "~/.local/share/fcitx5/skk/user.dict",
  },
  sources = { "skk_server", "skk_dictionary" },
  completionRankFile = "~/.cache/skkeleton/rank.json",
})

vim.cmd([[call skkeleton#register_keymap('input', "x", 'disable')]])
