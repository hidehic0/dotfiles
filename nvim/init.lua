local dpp_src = "/home/hidehico/.cache/dpp/dpp.vim"
-- print(dpp_src)

vim.opt.runtimepath:prepend(dpp_src)
local dpp = require("dpp")

local dpp_base = "$HOME/.cache/dpp/"
local dpp_config = "$HOME/.config/nvim/dpp.ts"

local denops_src = "/home/hidehico/.cache/dpp/denops.vim"

local ext_toml = "/home/hidehico/.cache/dpp/dpp-ext-toml"
local ext_lazy = "/home/hidehico/.cache/dpp/dpp-ext-lazy"
local ext_installer = "/home/hidehico/.cache/dpp/dpp-ext-installer"
local ext_git = "/home/hidehico/.cache/dpp/dpp-protocol-git"

vim.opt.runtimepath:append(ext_toml)
vim.opt.runtimepath:append(ext_git)
vim.opt.runtimepath:append(ext_lazy)
vim.opt.runtimepath:append(ext_installer)

if dpp.load_state(dpp_base) then
  vim.opt.runtimepath:prepend(denops_src)

  vim.api.nvim_create_autocmd("User", {
    pattern = "DenopsReady",
    callback = function()
      vim.notify("vim load_state is failed")
      dpp.make_state(dpp_base, dpp_config)
    end,
  })
end

require("core.keymaps")
require("core.options")
require("core.indent")
-- require("core.lazyvim")
