-- lua_source {{{
local augend = require("dial.augend")
require("dial.config").augends:register_group({
  default = {
    augend.integer.alias.decimal_int,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.constant.alias.bool,
    augend.constant.new({
      elements = { "True", "False" },
      word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
      cyclic = true, -- "or" is incremented into "and".
    }),
  },
})

require("utils").keymaps_set({
  {
    mode = "n",
    lhs = "<C-a>",
    rhs = function()
      require("dial.map").manipulate("increment", "normal")
    end,
  },
  {
    mode = "n",
    lhs = "<C-x>",
    rhs = function()
      require("dial.map").manipulate("decrement", "normal")
    end,
  },
  {
    mode = "n",
    lhs = "g<C-a>",
    rhs = function()
      require("dial.map").manipulate("increment", "gnormal")
    end,
  },
  {
    mode = "n",
    lhs = "g<C-x>",
    rhs = function()
      require("dial.map").manipulate("decrement", "gnormal")
    end,
  },
})
-- }}}
