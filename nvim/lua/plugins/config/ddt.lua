vim.fn["ddt#custom#patch_global"]({
  -- ui = "terminal",
  uiParams = {
    terminal = {
      command = { "zsh" },
      split = "",
      promptPattern = [[\f\+>]],
      startInsert = true,
    },
  },
})

-- local keyopts = {
--   noremap = true,
--   silent = true,
--   nowait = true,
-- }

vim.keymap.set("n", "<C-t>", "<Cmd>call ddt#start(#{ui: 'terminal'})<CR>")
