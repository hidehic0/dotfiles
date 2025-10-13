if vim.loader then
  vim.loader.enable()
end

require("core.dpp")
require("core.keymaps")
require("core.options")
require("core.indent")

vim.cmd("syntax on")
