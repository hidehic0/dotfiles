-- lua_source {{{
local fn = require("artemis").fn

fn.ddt.custom.load_config(vim.fs.joinpath(vim.fn.stdpath("config"), "hooks", "ddt.ts"))

vim.keymap.set("n", "<C-t>", function()
  fn.ddt.start({ ui = "terminal", name = "ddt-ui-terminal" })
end)
-- }}}
