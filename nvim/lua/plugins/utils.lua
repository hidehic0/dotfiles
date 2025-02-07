---@type LazySpec
return {
  {
    "tani/vim-artemis",
    event = "VimEnter",
  },
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
    "vim-jp/vimdoc-ja",
    event = "VeryLazy",
  },
  {
    "Shougo/ddu.vim",
    event = "VeryLazy",
    dependencies = {
      "vim-denops/denops.vim",
      -- ui
      "Shougo/ddu-ui-ff",
      "Shougo/ddu-ui-filer",
      -- sources
      "Shougo/ddu-source-action",
      "Shougo/ddu-source-file",
      "Shougo/ddu-source-file_rec",
      "Shougo/ddu-source-line",
      "Shougo/ddu-source-register",
      "kyoh86/ddu-source-git_branch",
      "kyoh86/ddu-source-lazy_nvim",
      "matsui54/ddu-source-help",
      "shun/ddu-source-buffer",
      "shun/ddu-source-rg",
      "staticWagomU/ddu-source-patch_local",
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
      -- columns
      "Shougo/ddu-column-filename",
      -- sorters
      "Shougo/ddu-filter-sorter_alpha",
    },

    config = function()
      require("plugins.config.ddu")
    end,
  },
  {
    "vim-denops/denops.vim",
    dependencies = { "vim-denops/denops-shared-server.vim" },
    event = "VimEnter",
    config = function()
      vim.cmd([[let g:denops_server_addr = '127.0.0.1:32123']])
    end,
  },
  {
    "lambdalisue/vim-gin",
    dependencies = {
      "vim-denops/denops.vim",
      "monaqa/tree-sitter-unifieddiff",
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
    "folke/flash.nvim",
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
