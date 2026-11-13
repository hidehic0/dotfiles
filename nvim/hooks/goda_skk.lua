-- lua_source {{{
vim.g["goda_skk#config_dir"] = vim.fn.expand("$HOOK_DIR/goda-skk")

vim.keymap.set({ "i", "c" }, "<C-j>", function()
  vim.fn["goda_skk#enable"]()
end)

vim.api.nvim_create_autocmd({ "InsertLeavePre", "CmdlineLeavePre" }, {
  pattern = "*",
  callback = function()
    vim.fn["goda_skk#disable"]()
  end,
})
-- }}}
