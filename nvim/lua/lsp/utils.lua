local M = {}

M.vim_lsp_config_helper = function(servers)
  for _, name in ipairs(servers) do
    vim.lsp.config(name, require("lsp.servers." .. name))
  end
end

return M
