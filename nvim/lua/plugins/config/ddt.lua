vim.fn["ddt#custom#patch_global"]({
  ui = "terminal",
  uiParams = {
    terminal = {
      command = { "zsh" },
      split = "floating",
      promptPattern = [[\f\+>]],
      startInsert = true,
      winCol = 37,
      winRow = 7,
      winWidth = 120,
      winHeight = 35,
    },
  },
})

vim.keymap.set("n", "<C-t>", "<Cmd>call ddt#start()<CR>", {
  noremap = true,
  silent = true,
  nowait = true,
})
