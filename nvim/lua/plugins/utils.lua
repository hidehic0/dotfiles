return {
  {
    "git@github.com:tani/vim-artemis",
    event = "VimEnter",
  },
  {
    "git@github.com:windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {},
  },
  {
    "git@github.com:kylechui/nvim-surround",
    event = "VeryLazy",
    version = "*",
    opts = {},
  },
  {
    "git@github.com:Shougo/ddt.vim",
    event = "VeryLazy",
    dependencies = {
      "git@github.com:Shougo/ddt-ui-terminal",
    },
    config = function()
      require("plugins.config.ddt")
    end,
  },
  {
    "git@github.com:vim-skk/skkeleton",
    dependencies = {
      "git@github.com:vim-denops/denops.vim",
    },
    event = "VimEnter",
    config = function()
      require("plugins.config.skkeleton")
    end,
  },
  {
    "git@github.com:vim-jp/vimdoc-ja",
    event = "VeryLazy",
  },
  {
    "git@github.com:Shougo/ddu.vim",
    event = "VeryLazy",
    dependencies = {
      "git@github.com:vim-denops/denops.vim",
      -- ui
      "git@github.com:Shougo/ddu-ui-ff",
      "git@github.com:Shougo/ddu-ui-filer",
      -- sources
      "git@github.com:Shougo/ddu-source-action",
      "git@github.com:Shougo/ddu-source-file",
      "git@github.com:Shougo/ddu-source-file_rec",
      "git@github.com:Shougo/ddu-source-line",
      "git@github.com:matsui54/ddu-source-help",
      "git@github.com:shun/ddu-source-buffer",
      "git@github.com:shun/ddu-source-rg",
      "git@github.com:uga-rosa/ddu-source-lsp",
      -- kinds
      "git@github.com:Shougo/ddu-kind-file",
      "git@github.com:Shougo/ddu-kind-word",
      -- filters
      "git@github.com:yuki-yano/ddu-filter-fzf",
      -- converters
      "git@github.com:uga-rosa/ddu-filter-converter_devicon",
      -- commands
      "git@github.com:Shougo/ddu-commands.vim",
      -- columns
      "git@github.com:Shougo/ddu-column-filename",
      -- sorters
      "git@github.com:Shougo/ddu-filter-sorter_alpha",
    },

    config = function()
      require("plugins.config.ddu")
    end,
  },
  {
    "git@github.com:vim-denops/denops.vim",
    dependencies = { "git@github.com:vim-denops/denops-shared-server.vim" },
    event = "VimEnter",
    config = function()
      vim.cmd([[let g:denops_server_addr = '127.0.0.1:32123']])
    end,
  },
  {
    "git@github.com:lambdalisue/vim-gin",
    dependencies = {
      "git@github.com:vim-denops/denops.vim",
      "git@github.com:monaqa/tree-sitter-unifieddiff",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>ga", "<CMD>Gin add -A<CR>", desc = "run Git add" },
      {
        "<leader>gd",
        [[ <CMD>split | GinDiff ++processor=delta\ --no-gitconfig\ --color-only<CR> ]],
        desc = "show Git diff",
      },
      {
        "<leader>gD",
        [[ <CMD>split | GinDiff ++processor=delta\ --no-gitconfig\ --color-only --cached<CR> ]],
        desc = "show Git diff cached",
      },
      {
        "<leader>gp",
        [[<CMD>lua vim.notify("run Git pull") <CR><CMD> Gin pull<CR>]],
        desc = "run Git pull",
      },
      {
        "<leader>gP",
        [[<CMD>lua vim.notify("run Git push") <CR><CMD> Gin push<CR>]],
        desc = "run Git push",
      },
      {
        "<leader>gc",
        [[<CMD>Gin commit<CR>]],
        desc = "Git commit",
      },
      {
        "<leader>gl",
        "<CMD>vsplit | wincmd l | GinLog --graph --oneline<CR>",
        desc = "show Git Log",
      },
    },
  },
  {
    "git@github.com:folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          enabled = true,
          multi_line = false,
          search = { wrap = false },
          highlight = { backdrop = true, groups = { label = "", backdrop = "" } },
          jump = { register = false },
        },
      },
    },
  },
}
