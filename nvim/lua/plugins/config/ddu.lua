local fn = require("artemis").fn
vim.fn["ddu#custom#load_config"](vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins", "config", "ddu_core.ts"))
-- custom sources
local patch_local = fn.ddu.custom.patch_local

patch_local("file_rec", {
  sources = {
    {
      name = "file_rec",
      params = {},
    },
  },
  uiParams = {
    ff = {
      floatingTitle = "File Rec :)",
    },
  },
})

patch_local("rg", {
  sources = {
    {
      name = "rg",
      options = {
        volatile = true,
      },
    },
  },
  uiParams = {
    ff = {
      floatingTitle = "LIVE GREP :)",
    },
  },
})

patch_local("lines", {
  sources = {
    {
      name = "line",
    },
  },
  uiParams = {
    ff = {
      floatingTitle = "Line Search :)",
    },
  },
})

patch_local("help", {
  sources = {
    {
      name = "help",
    },
  },
  uiParams = {
    ff = {
      floatingTitle = "󰋗 Help Search",
    },
  },
})

patch_local("buffer", {
  sources = {
    {
      name = "buffer",
    },
  },
  uiParams = {
    ff = {
      floatingTitle = "Buffer Search :)",
    },
  },
})

patch_local("register", {
  sources = {
    {
      name = "register",
    },
  },
  uiParams = {
    ff = {
      floatingTitle = "Register Search :)",
    },
  },
})

patch_local("branch", {
  sources = {
    {
      name = "git_branch",
    },
  },
})

patch_local("lsp_r", {
  sources = {
    {
      name = "lsp_references",
    },
  },
})

patch_local("lsp_e", {
  sources = {
    { name = "lsp_diagnostic", params = {
      buffer = 0,
    } },
  },
})

patch_local("lsp_d", {
  sync = true,
  sources = {
    name = "lsp_definition",
  },
})

patch_local("filer", {
  ui = "filer",
  sources = {
    { name = "file" },
  },
  sourceOptions = {
    _ = {
      columns = { "filename" },
      sorters = {
        "sorter_alpha",
      },
    },
  },
  kindOptions = {
    file = {
      defaultAction = "open",
    },
  },
})

-- keymaps
vim.keymap.set("n", "<leader>ff", [[<CMD>call ddu#start(#{name: "file_rec"})<CR>]], { desc = "start ddu file_rec" })
vim.keymap.set("n", "<leader>fg", [[<CMD>call ddu#start(#{name: "rg"})<CR>]], { desc = "start ddu ripgrep" })
vim.keymap.set("n", "<leader>fr", [[<CMD>call ddu#start(#{name: "lines"})<CR>]], { desc = "start ddu line search" })
vim.keymap.set("n", "<leader>fb", [[<CMD>call ddu#start(#{name: "buffer"})<CR>]], { desc = "start ddu buffer search" })
vim.keymap.set("n", "<leader>fh", [[<CMD>call ddu#start(#{name: "help"})<CR>]], { desc = "start ddu help search" })
vim.keymap.set("n", "<leader>fs", [[<CMD>call ddu#start(#{name: "branch"})<CR>]], { desc = "start ddu branch search" })
vim.keymap.set(
  "n",
  "<leader>ft",
  [[<CMD>call ddu#start(#{name: "register"})<CR>]],
  { desc = "start ddu register search" }
)
vim.keymap.set("n", "<leader>flr", [[<CMD>call ddu#start(#{name: "lsp_r"})<CR>]])
vim.keymap.set("n", "<leader>fle", [[<CMD>call ddu#start(#{name: "lsp_e"})<CR>]])
vim.keymap.set("n", "<leader>fld", [[<CMD>call ddu#start(#{name: "lsp_d"})<CR>]])

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
    vim.keymap.set(
      "n",
      "<CR>",
      [[<CMD>call ddu#ui#do_action("itemAction")<CR><Cmd>call ddu#ui#do_action("closePreviewWindow")<CR><CMD>call ddu#ui#do_action("quit")<CR>]],
      opts
    )
    vim.keymap.set("n", "i", [[<Cmd>call ddu#ui#do_action("openFilterWindow")<CR>]], opts)
    vim.keymap.set("n", "a", [[<Cmd>call ddu#ui#do_action("chooseAction")<CR>]], opts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ddu-filer",
  callback = function()
    -- vim.fn["ddu#ui#do_action#togglePreview"]()
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set("n", "q", [[<CMD>call ddu#ui#do_action("quit")<CR>]], opts)
    vim.cmd([[
    nnoremap <buffer><silent><expr> <CR>
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open', 'params': {'command': 'drop'}})<CR>"
    ]])
    vim.keymap.set(
      "n",
      "..",
      "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>"
    )
    vim.keymap.set("n", "i", [[<Cmd>call ddu#ui#do_action("openFilterWindow")<CR>]], opts)
    vim.keymap.set("n", "a", [[<Cmd>call ddu#ui#do_action("chooseAction")<CR>]], opts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ddu-ff-filter",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set({ "n", "i" }, "<CR>", [[<Esc><Cmd>close<CR>]], opts)
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "Ddu:uiDone",
  callback = function()
    vim.fn.timer_start(0, function()
      vim.fn["ddu#ui#sync_action"]("openFilterWindow")
    end)
  end,
  once = true,
  nested = true,
})
