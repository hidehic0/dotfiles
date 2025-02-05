vim.g.copilot_no_tab_map = true
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "Shougo/ddc-source-lsp",
    },
    config = function()
      require("plugins/config/nvim-lspconfig")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.config.lspsaga")
    end,
  },
  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function()
      require("neodim").setup({
        alpha = 0.75,
        blend_color = nil,
        hide = {
          underline = true,
          virtual_text = true,
          signs = true,
        },
        regex = {
          "[uU]nused",
          "[nN]ever [rR]ead",
          "[nN]ot [rR]ead",
        },
        priority = 128,
        disable = {},
      })
    end,
  },
  {
    "matsui54/denops-popup-preview.vim",
    dependencies = {
      "vim-denops/denops.vim",
    },
    event = "VimEnter",
    config = function()
      vim.fn["popup_preview#enable"]()
    end,
  },
  {
    "matsui54/denops-signature_help",
    dependencies = {
      "vim-denops/denops.vim",
    },
    event = "VimEnter",
    config = function()
      vim.fn["signature_help#enable"]()
    end,
  },
  {
    "Shougo/ddc.vim",
    dependencies = {
      -- denops
      "vim-denops/denops.vim",
      -- ui
      "Shougo/ddc-ui-pum",
      "Shougo/pum.vim",
      -- sources
      "Shougo/ddc-source-around",
      "Shougo/ddc-source-cmdline",
      -- "Shougo/ddc-source-copilot",
      "Shougo/ddc-source-lsp",
      "Shougo/ddc-source-shell-native",
      -- sorters
      "tani/ddc-fuzzy",
      -- snip
      "hrsh7th/vim-vsnip",
      -- converters
      "Shougo/ddc-filter-converter_remove_overlap",
      "Shougo/ddc-filter-converter_truncate_abbr",
      -- filters
      "Shougo/ddc-filter-matcher_prefix",
    },
    event = {
      "CmdlineEnter",
      "CmdlineChanged",
      "InsertEnter",
      "TextChangedI",
      "TextChangedP",
      "TextChangedT",
    },
    config = function()
      require("plugins/config/ddc")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require("plugins.config.nvim-lint")
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.config.conform")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
    },
    event = "LspAttach",
    config = function()
      require("plugins.config.nvim-dap")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
    },
    event = { "BufReadPre", "BufNewFile" },
    build = { ":TSUpdate" },
    config = function()
      require("plugins.config.treesitter")
    end,
  },
  -- {
  --   "github/copilot.vim",
  --   event = { "InsertEnter" },
  --   cmd = { "Copilot" },
  -- },
}
