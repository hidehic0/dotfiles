---@type vim.lsp.Config
return {
  filetypes = { "yaml", "yaml.ghaction" },
  settings = {
    yaml = {
      format = {
        enable = true,
        singleQuote = false,
        bracketSpacing = true,
        proseWrap = "Never",
      },
    },
  },
}
