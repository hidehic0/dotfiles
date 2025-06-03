vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
-- vim.cmd("syntax off") -- レガシーハイライト無効
vim.cmd([[set guifont="FiraCode Nerd Font"]])
vim.cmd([[set shadafile="NONE"]])
vim.opt.termguicolors = true

-- exrc
vim.opt.exrc = true
vim.opt.secure = true

-- statusline
vim.opt.laststatus = 3
-- vim.o.cmdheight = 0
vim.o.showmode = false
vim.o.cursorline = false

vim.cmd([[let &grepprg='rg --vimgrep']])

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.filetype.add({
  pattern = {
    [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
    [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",
  },
})

-- copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_enabled = false -- 有効化関連

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method("textDocument/documentColor") then
      vim.lsp.document_color.enable(true, args.buf)
    end
  end,
})

vim.g.hardtime_enabled = true

vim.opt.cmdheight = 0

-- require("vim._extui").enable({
--   enable = true, -- Whether to enable or disable the UI.
--   msg = { -- Options related to the message module.
--     ---@type 'box'|'cmd' Type of window used to place messages, either in the
--     ---cmdline or in a separate message box window with ephemeral messages.
--     pos = "cmd",
--     box = { -- Options related to the message box window.
--       timeout = 4000, -- Time a message is visible.
--     },
--   },
-- })

-- insert modeでbackspaceが効かなくなる事があるので修正
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.keymap.set("i", "<BS>", "<BS>", { noremap = true })
  end,
})
