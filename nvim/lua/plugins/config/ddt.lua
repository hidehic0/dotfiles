vim.fn["ddt#custom#patch_global"]({
  nvimServer = "~/.cache/nvim/server.pipe",
  uiParams = {
    terminal = {
      command = { "zsh" },
      split = "farleft",
      promptPattern = vim.fn.has("win32") == 1 and "\\f\\+>" or "\\w*%% %?",
      startInsert = true,
    },
  },
})

-- local keyopts = {
--   noremap = true,
--   silent = true,
--   nowait = true,
-- }

vim.keymap.set("n", "<C-t>", "<Cmd>call ddt#start(#{ui: 'terminal'})<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ddt-terminal",
  callback = function()
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = true })
  end,
})
