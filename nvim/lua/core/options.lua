vim.env.XDG_STATE_HOME = "/tmp"
vim.opt.undodir = vim.env.XDG_STATE_HOME .. "/nvim/undo"
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
-- vim.cmd("syntax off") -- レガシーハイライト無効
-- vim.cmd([[set guifont="FiraCode Nerd Font"]])

if vim.fn.has("gui_running") == 1 then
  vim.o.guifont = "FiraCode Nerd Font:h12"
end
vim.opt.termguicolors = true

-- mouse
vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  callback = function()
    vim.opt.mouse = "nv"
  end,
})

-- exrc
vim.opt.exrc = true
vim.opt.secure = true

-- statusline
vim.opt.laststatus = 3
-- vim.o.cmdheight = 0
vim.o.showmode = false
vim.o.cursorline = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.cmd([[let &grepprg='rg --vimgrep']])

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.filetype.add({
  pattern = {
    [".*/.github/workflows/.*%.yml"] = "yaml.ghaction",
    [".*/.github/workflows/.*%.yaml"] = "yaml.ghaction",
    [".*/git/config"] = "gitconfig",
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

-- insert modeでbackspaceが効かなくなる事があるので修正
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.keymap.set("i", "<BS>", "<BS>", { noremap = true })
  end,
})

require("vim._extui").enable({
  enable = true, -- Whether to enable or disable the UI.
  msg = {        -- Options related to the message module.
    ---@type 'cmd'|'msg' Where to place regular messages, either in the
    ---cmdline or in a separate ephemeral message window.
    target = "cmd",
    timeout = 4000, -- Time a message is visible in the message window.
  },
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- undotree
vim.cmd("packadd nvim.undotree")

-- restart
-- 参考: https://zenn.dev/vim_jp/articles/2308d5e7db8bc7
vim.api.nvim_create_user_command("Restart", function()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[bufnr].buftype ~= "" then
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end
  end

  local session = vim.fs.joinpath(tostring(vim.fn.stdpath("state")), "restart_session.vim")
  vim.fn.mkdir(vim.fs.dirname(session), "p")
  vim.cmd.mksession({ args = { session }, bang = true })
  vim.fn.jobstart({ "sed", "-i", "s/setlocal.winbar.*//g", session }) -- workaround
  vim.cmd.restart({ args = { "source", session } })
end, { desc = "Restart current Neovim session" })
vim.keymap.set("n", "<leader>R", "<Cmd>Restart<CR>", { desc = "Restart current Neovim session" })
