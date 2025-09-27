-- lua_source {{{
require("nightfox").setup({
  options = {
    transparent = true,
  },
})

vim.cmd("colorscheme terafox")
-- }}}
-- lua_post_update {{{
require("nightfox").compile()
-- }}}
