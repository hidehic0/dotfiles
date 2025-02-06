local fn = require("artemis").fn
vim.fn["ddu#custom#load_config"](vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins", "config", "ddu.ts"))

-- helpers

--- @param key string
--- @param name string
--- @param desc string
local function set_keymap(key, name, desc)
  vim.keymap.set("n", key, string.format("[[<CMD>call ddu#start(#{name: '%s'})<CR>]]", name), { desc = desc })
end

-- keymaps
set_keymap("<leader>ff", "file_rec", "start ddu file_rec")
set_keymap("<leader>fg", "rg", "start ddu ripgrep")
set_keymap("<leader>fr", "lines", "start ddu line search")
set_keymap("<leader>fb", "buffer", "start ddu buffer search")
set_keymap("<leader>fh", "help", "start ddu help search")
set_keymap("<leader>fs", "branch", "start ddu branch search")
set_keymap("<leader>ft", "register", "start ddu register search")

-- autocmds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ddu-ff",
  callback = function()
    -- vim.fn["ddu#ui#do_action#togglePreview"]()
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set(
      "n",
      "q",
      [[<Cmd>call ddu#ui#do_action("closePreviewWindow")<CR><CMD>call ddu#ui#do_action("quit")<CR>]],
      opts
    )
    vim.keymap.set("n", "<CR>", [[<CMD>call ddu#ui#do_action("itemAction")<CR>]], opts)
    vim.keymap.set("n", "i", [[<Cmd>call ddu#ui#do_action("openFilterWindow")<CR>]], opts)
    vim.keymap.set("n", "a", [[<Cmd>call ddu#ui#do_action("chooseAction")<CR>]], opts)
  end,
})
