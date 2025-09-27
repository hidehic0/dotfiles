local dpp_base = "~/.local/share/nvim/dpp/"
vim.env.HOOK_DIR = "~/.config/nvim/hooks"

local plugins = {
  "Shougo/dpp.vim",
  "Shougo/dpp-ext-lazy",
  "Shougo/dpp-ext-toml",
  "Shougo/dpp-ext-installer",
  "Shougo/dpp-protocol-git",
  "vim-denops/denops.vim",
}

for i in pairs(plugins) do
  vim.opt.runtimepath:prepend(dpp_base .. "repos/github.com/" .. plugins[i])
end

local dpp = require("dpp")

if dpp.load_state(dpp_base) then
  vim.api.nvim_create_autocmd("User", {
    pattern = "DenopsReady",
    callback = function()
      vim.notify("dpp load_state() is failed")
      dpp.make_state(dpp_base, "~/.config/nvim/dpp.ts")
    end,
  })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "Dpp:makeStatePost",
  callback = function()
    vim.notify("dpp make_state() is done")
  end,
})

vim.api.nvim_create_user_command("DppReload", function()
  dpp.clear_state()
  print("old state removed")
  dpp.make_state(dpp_base, "~/.config/nvim/dpp.ts")
end, {})

vim.api.nvim_create_user_command("DppInstall", function()
  dpp.async_ext_action("installer", "install")
end, {})

vim.api.nvim_create_user_command("DppUpdate", function()
  dpp.async_ext_action("installer", "update")
end, {})
