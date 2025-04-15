local config_helper = require("lsp.utils").vim_lsp_config_helper
local servers = { "lua_ls", "jedi_ls", "ruff", "clangd", "denols", "marksman" }

local capabilities = require("ddc_source_lsp").make_client_capabilities()
vim.lsp.config("*", {
  root_markers = { ".git" },
  capabilities = capabilities,
})

config_helper(servers)
vim.lsp.enable(servers)
