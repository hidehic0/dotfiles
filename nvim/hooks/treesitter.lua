-- lua_source {{{
require("nvim-treesitter").setup({
  install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
})

local langs = {
  "python",
  "bash",
  "markdown",
  "cpp",
  "toml",
  "yaml",
  "lua",
  "vimdoc",
  "checkhealth",
  "git_config",
  "gitignore",
  "gitcommit",
  "go",
  "json",
  "ecma",
  "rust",
  "vim",
  "jsx",
  "make",
}

local assist = {
  "markdown_inline",
}

local register_langs = {
  zsh = "bash",
  ["yaml.ghaction"] = "yaml",
  gitconfig = "ini",
}

local parsers = {}

for _, v in ipairs(langs) do
  table.insert(parsers, v)
end

for k, v in pairs(register_langs) do
  vim.treesitter.language.register(v, { k })
  table.insert(langs, k)
end

for _, v in ipairs(assist) do
  table.insert(parsers, v)
  table.insert(langs, v)
end

require("nvim-treesitter").install(parsers):wait(300000)

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = langs,
  callback = function()
    vim.treesitter.start()
    -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- }}}

-- lua_post_update {{{
vim.cmd([[TSUpdate]])
-- }}}
