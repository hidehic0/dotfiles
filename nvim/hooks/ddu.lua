-- lua_source {{{
local fn = require("artemis").fn
local customAction = fn.ddu.custom.action
local doAction = fn.ddu.ui.do_action

vim.fn["ddu#custom#load_config"](vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins", "config", "ddu.ts"))

-- helpers

--- @param key string
--- @param name string
--- @param desc string
local function set_keymap(key, name, desc)
  vim.keymap.set("n", key, "<CMD>Ddu -name=" .. name .. "<CR>", { desc = desc })
end

-- keymaps
set_keymap("<leader>ff", "file_rec", "start ddu file_rec")
set_keymap("<leader>e", "filer", "start ddu filer")
set_keymap("<leader>fg", "rg", "start ddu ripgrep")
set_keymap("<leader>fr", "lines", "start ddu line search")
-- set_keymap("<leader>fb", "buffer", "start ddu buffer search")
set_keymap("<leader>fh", "help", "start ddu help search")
set_keymap("<leader>fs", "git_branch", "start ddu branch search")
set_keymap("<leader>ft", "patch_local", "start patch_local search")
set_keymap("<leader>ca", "lsp_codeAction", "open code actions")
set_keymap("<leader>cl", "lsp_documentSymbol", "show docment symbols")

-- custom actions
customAction("ui", "ff", "close-ui-ff", function()
  doAction("closePreviewWindow")
  doAction("quit")
end)

-- vim.fn["ddu#ui#do_action#togglePreview"]()
local opts = { noremap = true, silent = true, buffer = true }

local function map_action(key, name, args)
  vim.keymap.set("n", key, function()
    doAction(name, args)
  end, opts)
end

--- @param key string
--- @param name string
local function map_item_action(key, name)
  map_action(key, "itemAction", { name = name, quit = true })
end

-- autocmds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ddu-ff",
  callback = function()
    vim.keymap.set("n", "q", [[<Cmd>call ddu#ui#do_action("close-ui-ff")<CR>]], opts)
    -- vim.keymap.set("n", "<CR>", [[<CMD>call ddu#ui#do_action("itemAction")<CR>]], opts)
    vim.keymap.set("n", "<CR>", function()
      local item = fn.ddu.ui.get_item()
      if item.isTree then
        fn.ddu.ui.do_action("itemAction", { name = "narrow" })
      else
        fn.ddu.ui.do_action("itemAction")
      end
    end, opts)
    vim.keymap.set(
      "n",
      "a",
      [[<Cmd>call ddu#ui#do_action("chooseAction")<CR><Cmd>call ddu#ui#do_action("openFilterWindow")<CR>]],
      opts
    )
    map_action("i", "openFilterWindow")
    map_action("/", "openFilterWindow")
    map_action("j", "cursorNext", { loop = true })
    map_action("k", "cursorPrevious", { loop = true })
    map_item_action("d", "delete")
    map_item_action("o", "newFile")
    map_item_action("O", "newDirectory")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ddu-filer",
  callback = function()
    vim.keymap.set("n", "<CR>", function()
      if fn.ddu.ui.get_item().isTree then
        doAction("expandItem", { isInTree = true })
        doAction("clearSelectAllItems")
      else
        doAction("itemAction", { name = "open" })
      end
    end)
    map_action("i", "openFilterWindow")
    map_action("/", "openFilterWindow")
    map_action("j", "cursorNext", { loop = true })
    map_action("k", "cursorPrevious", { loop = true })
    map_action("q", "quit")
    map_action("a", "chooseAction")
    map_item_action("d", "delete")
    map_item_action("r", "rename")
    map_item_action("o", "newFile")
    map_item_action("O", "newDirectory")
  end,
})
-- }}}
