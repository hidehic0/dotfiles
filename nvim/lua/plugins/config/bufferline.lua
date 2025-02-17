require("bufferline").setup({
  options = {
    -- mode = "tabs",
    themable = true,
    color_icons = true,
    diagnostics = "nvim_lsp",
    diagnostics_update_on_event = true,
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  },
})

vim.api.nvim_set_keymap("n", "gt", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
-- 前のバッファへ移動
vim.api.nvim_set_keymap("n", "gT", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
-- バッファを削除
vim.api.nvim_set_keymap("n", "<leader>q", ":bdelete<CR>", { noremap = true, silent = true })
