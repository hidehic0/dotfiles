-- lua_source {{{
vim.defer_fn(function()
  require("lualine").setup({
    sections = {
      -- add to section of your choice
      lualine_c = { "lsp-status", "macro_recording", "%S" },
    },
  })
end, 100)
-- }}}
