-- mapの設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- jj をescにする設定
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
-- クリップボードの設定
vim.opt.clipboard:append({ "unnamedplus" })
-- xでレジスタを汚さないようにする設定
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })

-- 競プロ用コードを全コピー
vim.api.nvim_set_keymap("n", "<leader>a", "GyggG", { noremap = true, silent = true })
