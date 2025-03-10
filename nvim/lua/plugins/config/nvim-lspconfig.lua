local lspconfig = require("lspconfig")
local capabilities = require("ddc_source_lsp").make_client_capabilities()

local python_venv_path = vim.fn.system("which python"):gsub("\n", "")

local configs = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          pathStrict = true,
          path = { "?.lua", "?/init.lua" },
        },
        workspace = {
          library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
            "${3rd}/luv/library",
            "${3rd}/busted/library",
            "${3rd}/luassert/library",
          }),
          checkThirdParty = "Disable",
        },
      },
    },
  },
  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          ignore = { "*" },
        },
        pythonPath = python_venv_path,
      },
    },
  },
  clangd = {},
  ruff = {},
  denols = {},
  marksman = {},
  nimls = {
    cmd = { "nimlsp", "--stdin ", "--trace" }, -- `nimlsp` の実行コマンド
    filetypes = { "nim" }, -- Nimファイルに適用
    root_dir = lspconfig.util.root_pattern("*.nim", ".git"),
  },
}

local default_options = {
  capabilities = capabilities,
}

for name, config in pairs(configs) do
  local new_config = {}

  for k, v in pairs(default_options) do
    new_config[k] = v
  end

  for k, v in pairs(config) do
    new_config[k] = v
  end

  lspconfig[name].setup(new_config)
end
