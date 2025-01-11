local lspconfig = require("lspconfig")
local capabilities = require("ddc_source_lsp").make_client_capabilities()

lspconfig["denols"].setup({
  capabilities =capabilities,
})

lspconfig["lua_ls"].setup({
  capabilities=capabilities,
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
    },
  },
})
lspconfig["ruff"].setup({})
