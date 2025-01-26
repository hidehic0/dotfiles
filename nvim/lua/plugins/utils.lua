return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    version = "*",
    opts = {},
  },
  {
    "Shougo/ddt.vim",
    event = "VeryLazy",
    dependencies = {
      "Shougo/ddt-ui-terminal",
    },
    config = function()
      require("plugins.config.ddt")
    end,
  },
  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim",
    },
    event = "VimEnter",
    config = function()
      require("plugins.config.skkeleton")
    end,
  },
  {
    "Shougo/ddu.vim",
    event = "VeryLazy",
    dependencies = {
      "vim-denops/denops.vim",
      -- ui
      "Shougo/ddu-ui-ff",
      -- sources
      "Shougo/ddu-source-action",
      "Shougo/ddu-source-file",
      "Shougo/ddu-source-file_rec",
      "Shougo/ddu-source-line",
      "shun/ddu-source-rg",
      "uga-rosa/ddu-source-lsp",
      -- kinds
      "Shougo/ddu-kind-file",
      "Shougo/ddu-kind-word",
      -- filters
      "yuki-yano/ddu-filter-fzf",
      -- converters
      "uga-rosa/ddu-filter-converter_devicon",
      -- commands
      "Shougo/ddu-commands.vim",
    },

    config = function()
      require("plugins.config.ddu")
    end,
  },
  {
    "vim-denops/denops.vim",
    event = "VimEnter",
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = {
      { "<Leader>ga", "<CMD>Git add -A<CR>", desc = "run Git add" },
      { "<Leader>gp", "<CMD>Git pull<CR>", desc = "run Git pull" },
      { "<Leader>gP", "<CMD>Git push<CR>", desc = "run Git push" },
      { "<Leader>gc", "<CMD>Git commit<CR>", desc = "run Git commit" },
      { "<Leader>gd", "<CMD>Git diff --cached<CR>", desc = "check Git diff" },
    },
  },
}
