-- mapの設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- jj をescにする設定
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
-- クリップボードの設定
vim.opt.clipboard = "unnamedplus"
-- xでレジスタを汚さないようにする設定
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })

-- 競プロ用コードを全コピー
vim.api.nvim_set_keymap("n", "<leader>a", "GyggG", { noremap = true, silent = true })

-- Center the screen on move
for _, rhs in pairs({ "gg", "G", "h", "l", "j", "k", "<C-d>", "<C-u>" }) do
  vim.keymap.set("n", rhs, rhs .. "zz", { noremap = true })
end
