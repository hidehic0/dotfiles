local lspconfig = require("lspconfig")
local capabilities = require("ddc_source_lsp").make_client_capabilities()

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
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
})

local python_venv_path = vim.fn.system("which python"):gsub("\n", "")

lspconfig["pyright"].setup({
  capabilities = capabilities,
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
})

lspconfig["clangd"].setup({
  capabilities = capabilities,
})

lspconfig["ruff"].setup({})

vim.g.markdown_fenced_languages = {
  "ts=typescript",
}

lspconfig["denols"].setup({
  capabilities = capabilities,
})

lspconfig["marksman"].setup({
  capabilities = capabilities,
})

lspconfig["nimls"].setup({
  capabilities = capabilities,
  cmd = { "nimlsp", "--stdin ", "--trace" }, -- `nimlsp` の実行コマンド
  filetypes = { "nim" }, -- Nimファイルに適用
  root_dir = lspconfig.util.root_pattern("*.nim", ".git"),
})
