vim.fn["deol#set_option"]({
  split = "floating",
  command = { "zsh" },
  toggle = true,
  winwidth = 100,
  winheight = 40,
  winrow = 5,
})

vim.keymap.set("n", "<C-t>", "<CMD>call deol#start()<CR>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-t>", "<CMD>call deol#start()<CR>", { noremap = true, silent = true })
