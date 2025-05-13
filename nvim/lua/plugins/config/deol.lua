local fn = require("artemis").fn

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
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = true })
    vim.keymap.set({ "n", "t" }, "<C-t>", function()
      fn.deol.start()
    end, { noremap = true })
  end,
})
