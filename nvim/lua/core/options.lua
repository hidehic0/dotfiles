vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
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

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = true,
  update_in_insert = true,
  underline = true,
})
