--- @param tools { name: string, ft:string[],type: "format"|"lint"}[]
local function get_config(tools)
  local config = {}

  for _, tool in pairs(tools) do
    for _, ft in pairs(tool.ft) do
      if config[ft] == nil then
        config[ft] = {}
      end

      if tool.type == "format" then
        table.insert(config[ft], require("efmls-configs.formatters." .. tool.name))
      elseif tool.type == "lint" then
        table.insert(config[ft], require("efmls-configs.linters." .. tool.name))
      end
    end
  end

  return config
end

local filetypes = { "lua", "zsh", "bash", "sh", "yaml", "ts", "tsx", "json" }

---@type vim.lsp.Config
return {
  cmd = { "efm-langserver" },
  filetypes = filetypes,
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    documentSymbol = true,
    codeAction = true,
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = get_config({
      {
        name = "shellcheck",
        ft = { "zsh", "bash", "sh" },
        type = "lint",
      },
      {
        name = "actionlint",
        ft = { "yaml" },
        type = "lint",
      },
      {
        name = "eslint_d",
        ft = { "ts", "tsx" },
        type = "lint",
      },
      { name = "stylua", ft = { "lua" }, type = "format" },
      {
        name = "shfmt",
        ft = { "zsh", "bash", "sh" },
        type = "format",
      },
      {
        name = "jq",
        ft = { "json", "jsonc" },
        type = "format",
      },
    }),
  },
  single_file_support = true,
}
