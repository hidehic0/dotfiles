require("lint").linters_by_ft = {
  -- lua = { "luacheck" },
  -- python = { "ruff" },
  zsh = { "shellcheck" },
  bash = { "shellcheck" },
  sh = { "shellcheck" },
  markdown = { "markdownlint-cli2" },
  ts = { "eslint_d" },
  tsx = { "eslint_d" },
  ["yaml.ghaction"] = { "actionlint" },
}
require("lint").try_lint()

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
