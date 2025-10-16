-- lua_source {{{
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require("ufo").setup({
  open_fold_hl_timeout = 150,
  ---@diagnostic disable-next-line: unused-local
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- }}}
