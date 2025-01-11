require("bufferline").setup({
  options = {
    -- mode = "tabs",
    color_icons = true,
    diagnostics = "nvim_lsp",
  },
})

vim.api.nvim_set_keymap("n", "gt", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
-- 前のバッファへ移動
vim.api.nvim_set_keymap("n", "gT", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
-- バッファを削除
vim.api.nvim_set_keymap("n", "<leader>q", ":bdelete<CR>", { noremap = true, silent = true })
