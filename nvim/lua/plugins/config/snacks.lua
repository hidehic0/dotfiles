----@type snacks.Config
require("snacks").setup({
  animate = { fps = 300 },
  input = {
    enabled = true,
  },
  notifier = {
    enabled = true,
  },
  indent = {},
  scope = { enabled = true },
  scroll = { enabled = true },
})

vim.g.snacks_animate = false
Snacks.indent.enable()
