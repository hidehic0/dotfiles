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

-- コマンドライン用キーマップ
require("utils").keymaps_set({
  { mode = "c", lhs = "<C-a>", rhs = "<Home>" },
  { mode = "c", lhs = "<C-e>", rhs = "<End>" },
  { mode = "c", lhs = "<C-f>", rhs = "<Right>" },
  { mode = "c", lhs = "<C-b>", rhs = "<Left>" },
})
