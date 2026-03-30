-- lua_source {{{
require("obsidian").setup({
  legacy_commands = false,
  workspaces = {
    { name = "main", path = "~/src/github.com/hidehic0/obsidain_vault" },
  },
  daily_notes = {
    folder = "dailies",
  },
})

vim.keymap.set("n", "<leader>oo", "<Cmd>Obsidian open<CR>")
-- }}}
