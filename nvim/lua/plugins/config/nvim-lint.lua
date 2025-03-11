vim.diagnostic.config({
  severity_sort = true,
  virtual_text = false,
  virtual_lines = {
    only_current_line = true,
  },
  update_in_insert = true,
})

require("lint").linters_by_ft = {
  -- lua = { "luacheck" },
  -- python = { "ruff" },
  zsh = { "shellcheck" },
  bash = { "shellcheck" },
  sh = { "shellcheck" },
  markdown = { "markdownlint-cli2" },
  ts = { "eslint_d" },
  tsx = { "eslint_d" },
}
require("lint").try_lint()

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
