vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.cmd([[set guifont="FiraCode Nerd Font"]])
vim.cmd([[set shadafile="NONE"]])
vim.opt.termguicolors = true

-- statusline
vim.opt.laststatus = 3
vim.o.cmdheight = 0
vim.o.cursorline = false

vim.cmd([[let &grepprg='rg --vimgrep']])
