vim.fn["ddu#custom#patch_global"]({
  -- ui settings
  ui = "ff",

  uiParams = {
    ff = {
      autoAction = {
        name = "preview",
      },
      autoResize = false,
      floatingBorder = "single",
      previewFloating = true,
      previewFloatingBorder = "single",
      prompt = "ddu.vim",
      split = "floating",
      updateTime = 0,
    },
  },
  -- source settings
  sourceOptions = {
    _ = {
      matchers = { "matcher_fzf" },
      sorters = { "sorter_fzf" },
      converters = { "converter_devicon" },
      ignoreCase = true,
    },
  },

  -- kind settings
  kindOptions = {
    file = {
      defaultAction = "open",
    },
    line = {
      defaultAction = "open",
    },
    rg = {
      defaultAction = "open",
    },
    lsp = {
      defaultAction = "open",
    },
    lsp_codeAction = {
      defaultAction = "apply",
    },
  },

  -- fileter settings
  filterParams = {
    matcher_fzf = {
      highlightMatched = "Search",
    },
  },
})

-- custom sources
local patch_local = vim.fn["ddu#custom#patch_local"]

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

patch_local("lsp_r", {
  sources = {
    {
      name = "lsp_references",
    },
  },
})

-- keymaps
vim.keymap.set("n", "<leader>ff", [[<CMD>call ddu#start(#{name: "file_rec"})<CR>]])
vim.keymap.set("n", "<leader>fg", [[<CMD>call ddu#start(#{name: "rg"})<CR>]])
vim.keymap.set("n", "<leader>fl", [[<CMD>call ddu#start(#{name: "lines"})<CR>]])

-- autocmds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ddu-ff",
  callback = function()
    -- vim.fn["ddu#ui#do_action#togglePreview"]()
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set("n", "q", [[<CMD>call ddu#ui#do_action("quit")<CR>]], opts)
    vim.keymap.set("n", "<CR>", [[<CMD>call ddu#ui#do_action("itemAction")<CR>]], opts)
    vim.keymap.set("n", "i", [[<Cmd>call ddu#ui#do_action("openFilterWindow")<CR>]], opts)
    vim.keymap.set("n", "P", [[<Cmd>call ddu#ui#do_action("togglePreview")<CR>]])
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
