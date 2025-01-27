vim.opt.swapfile = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.cmd([["set guifont='HackGen Console NF'"]])
vim.opt.signcolumn = "yes"
vim.cmd([[set shadafile="NONE"]])
vim.opt.termguicolors = true

vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

vim.cmd([[let &grepprg='rg --vimgrep']])
