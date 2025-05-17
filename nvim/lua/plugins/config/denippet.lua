local denippet = require("artemis").fn.denippet

local my_snippath = vim.fn.globpath(vim.fs.joinpath(vim.fn.stdpath("config"), "snippets"), "**/*.json", true, true)

for _, snip in ipairs(my_snippath) do
  vim.fn["denippet#load"](snip)
end
