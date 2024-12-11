local dppSrc = "~/.cache/dpp/dpp.vim"

vim.opt.runtimepath:prepend(dppSrc)
local dpp = require("dpp")

local denopsSrc = "~/.cache/dpp/denops.vim"
local denopsInstaller = "~/.cache/dpp/dpp-ext-installer"
local denopsLazy = "~/.cache/dpp/dpp-ext-installer"
local denopsToml = "~/.cache/dpp/dpp-ext-toml"
local denopsGit = "~/.cache/dpp/dpp-protocol-git"


vim.opt.runtimepath:append(denopsInstaller)
vim.opt.runtimepath:append(denopsLazy)
vim.opt.runtimepath:append(denopsToml)
vim.opt.runtimepath:append(denopsGit)

local dppBase = "~/.cache/dpp"
if dpp.load_state(dppBase) then
  vim.opt.runtimepath:prepend(denopsSrc)

  vim.api.nvim_create_autocmd("User", {
    pattern = "DenopsReady",
    callback = function()
      vim.notify("dpp load_state() is failed")
      dpp.make_state(dppBase, "~/dark_nvim/ts/dpp.ts")
    end,
  })
end


vim.cmd("filetype indent plugin on")
vim.cmd("syntax on")
