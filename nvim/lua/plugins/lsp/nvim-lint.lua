return {
  {
    "mfussenegger/nvim-lint",
    event = { "InsertLeave", "TextChanged" },
    config = function()
      require("lint").linters_by_ft = {
        lua = { "luac" },
        cpp = { "cppcheck" },
        zsh = { "zsh" }
      }

      vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  }
}
