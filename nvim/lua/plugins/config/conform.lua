require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- python = { "ruff_format" },
    zsh = { "shfmt" },
    bash = { "shfmt" },
    sh = { "shfmt" },
    yaml = { "yamlfmt" },
    -- typescript = { "deno_fmt" },
    json = { "jq" },
    -- nim = { "nimpretty" },
    -- go = { "gofmt" },
    markdown = { "markdownlint-cli2" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

-- vim.keymap.set({ "n" }, "<leader>s", require("conform").format, { noremap = true, silent = true, desc = "format" })
