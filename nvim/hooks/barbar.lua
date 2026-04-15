-- lua_source {{{
require("barbar").setup({
  animation = true,

  icons = {
    -- Configure the base icons on the bufferline.
    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = false,
    buffer_number = false,
    button = "",
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
      [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = false },
    },
    pinned = { button = "󰐃", filename = true },
  },
})

vim.keymap.set("n", "]b", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "[b", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<leader><", "<Cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "<leader>>", "<Cmd>BufferMoveNext<CR>")
vim.keymap.set("n", "<leader>q", "<Cmd>BufferClose<CR>")
-- }}}

-- lua_add {{{
vim.g.barbar_auto_setup = false
-- }}}
