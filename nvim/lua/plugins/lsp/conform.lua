return {
  {
    "stevearc/conform.nvim",
    event = { "CursorHold", "CursorHoldI" },
    config = function()
      require("conform").setup({
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
