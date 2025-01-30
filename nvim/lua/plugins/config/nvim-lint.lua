require("lint").linters_by_ft = {
  lua = { "luacheck" },
  -- python = { "ruff" },
  zsh = { "shellcheck" },
  bash = { "shellcheck" },
  sh = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
