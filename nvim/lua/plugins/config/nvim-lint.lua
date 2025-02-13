vim.diagnostic.config({
  virtual_text = true, -- エラーメッセージを表示する
  signs = true, -- エラーサインを表示する
  underline = true, -- エラー箇所に下線を引く
})

require("lint").linters_by_ft = {
  -- lua = { "luacheck" },
  -- python = { "ruff" },
  zsh = { "shellcheck" },
  bash = { "shellcheck" },
  sh = { "shellcheck" },
  markdown = { "markdownlint-cli2" },
}
require("lint").try_lint()

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
