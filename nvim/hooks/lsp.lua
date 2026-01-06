-- lua_source {{{
vim.lsp.config("*", {
  capabilities = require("ddc_source_lsp").make_client_capabilities(),
})

vim.lsp.enable({
  "lua_ls",
  -- "pyright",
  -- "ruff",
  "ty",
  "clangd",
  "denols",
  -- "marksman",
  "tombi",
  "nim_langserver",
  "gopls",
  "nil_ls",
  "ts_ls",
  "rust_analyzer",
  "yamlls",
  "efm",
  -- "markdown_oxide",
})
-- }}}
