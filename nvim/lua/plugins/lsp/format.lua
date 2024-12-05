return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim" },
    config = function()
      local null_ls = require("null-ls")

      -- 自動フォーマット用のオートグループを作成
      local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        debug = true,
        sources = {
          null_ls.builtins.formatting.prettier,
          require("none-ls.diagnostics.eslint"),
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.black,
          require("none-ls.formatting.ruff"),
          require("none-ls.diagnostics.ruff"),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = autogroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = autogroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  },
}
