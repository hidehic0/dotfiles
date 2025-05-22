local fn = require("artemis").fn
local keymaps_set = require("utils").keymaps_set

fn.deol.set_option({
  split = "vertical",
  toggle = true,
  winwidth = 75,
})

vim.keymap.set("n", "<C-t>", function()
  fn.deol.start()
end, { noremap = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "deol",
  callback = function()
    keymaps_set({
      { mode = "t", lhs = "<Esc>", rhs = "<C-\\><C-n>", { buffer = true } },
      {
        mode = { "n", "t" },
        lhs = "<C-t>",
        rhs = function()
          fn.deol.start()
        end,
        opts = { noremap = true },
      },
    })
  end,
})
