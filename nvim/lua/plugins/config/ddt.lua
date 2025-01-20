vim.fn["ddt#custom#patch_global"]({
  -- ui = "terminal",
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

-- local keyopts = {
--   noremap = true,
--   silent = true,
--   nowait = true,
-- }

vim.keymap.set("n", "<C-t>", "<Cmd>call ddt#start(#{ui: 'terminal'})<CR>")
