-- lua_source {{{
local my_snippath = vim.fn.globpath(vim.fs.joinpath(vim.fn.stdpath("config"), "snippets"), "**/*.json", true, true)
local friendly_snippets_path = vim.fn.globpath(
  vim.fs.joinpath(vim.fn.stdpath("data"), "dpp/repos/github.com/rafamadriz/friendly-snippets/snippets/"),
  "**/*.json",
  true,
  true
)

-- print(vim.fs.joinpath(vim.fn.stdpath("data"), "lazy/friendly-snippets/snippets"))

for _, snip in ipairs(my_snippath) do
  vim.fn["denippet#load"](snip)
end

for _, snip in ipairs(friendly_snippets_path) do
  -- print(snip)
  vim.fn["denippet#load"](snip)
end
-- }}}
