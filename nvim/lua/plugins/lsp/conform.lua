return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
      require("conform").setup({
        formatters = {
          ruff = {
            command = "/home/hidehico/.nix-profile/bin/ruff",
            args = { "format", "$FILENAME" }
          }
        },
        format_by_ft = {
          lua = { "stylua" },
          python = { "ruff" }
        }
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  }
}
