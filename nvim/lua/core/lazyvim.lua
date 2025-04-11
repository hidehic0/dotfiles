local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local opts = {
  defaults = {
    lazy = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
  -- git = {
  --   url_format = "git@github.com:%s.git", -- SSH経由でクローンする
  -- },
}

local function merge_lists(l)
  local result = {}
  for _, p in pairs(l) do
    for _, v in pairs(p) do
      table.insert(result, v)
    end
  end
  return result
end

require("lazy").setup(
  merge_lists({
    require("plugins.colorscheme"),
    require("plugins.ui"),
    require("plugins.utils"),
    require("plugins.coding"),
  }),
  opts
)
