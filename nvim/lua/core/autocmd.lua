-- デフォルトのtimeoutlenを保存
local default_timeoutlen = vim.o.timeoutlen

-- コマンドラインを呼び出したときにtimeoutlenを短く設定
vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    vim.o.timeoutlen = 100 -- 好きな短い値を設定（例: 100ms）
  end,
})

-- コマンドラインを終了したときにtimeoutlenを元に戻す
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    vim.o.timeoutlen = default_timeoutlen
  end,
})
