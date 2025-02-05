vim.g.copilot_no_tab_map = true
return {
  {
    "git@github.com:neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "git@github.com:Shougo/ddc-source-lsp",
    },
    config = function()
      require("plugins/config/nvim-lspconfig")
    end,
  },
  {
    "git@github.com:nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "git@github.com:nvim-treesitter/nvim-treesitter",
      "git@github.com:nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.config.lspsaga")
    end,
  },
  {
    "git@github.com:zbirenbaum/neodim",
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
    "git@github.com:matsui54/denops-popup-preview.vim",
    dependencies = {
      "git@github.com:vim-denops/denops.vim",
    },
    event = "VimEnter",
    config = function()
      vim.fn["popup_preview#enable"]()
    end,
  },
  {
    "git@github.com:matsui54/denops-signature_help",
    dependencies = {
      "git@github.com:vim-denops/denops.vim",
    },
    event = "VimEnter",
    config = function()
      vim.fn["signature_help#enable"]()
    end,
  },
  {
    "git@github.com:Shougo/ddc.vim",
    dependencies = {
      -- denops
      "git@github.com:vim-denops/denops.vim",
      -- ui
      "git@github.com:Shougo/ddc-ui-pum",
      "git@github.com:Shougo/pum.vim",
      -- sources
      "git@github.com:Shougo/ddc-source-around",
      "git@github.com:Shougo/ddc-source-cmdline",
      -- "Shougo/ddc-source-copilot",
      "git@github.com:Shougo/ddc-source-lsp",
      "git@github.com:Shougo/ddc-source-shell-native",
      -- sorters
      "git@github.com:tani/ddc-fuzzy",
      -- snip
      "git@github.com:hrsh7th/vim-vsnip",
      -- converters
      "git@github.com:Shougo/ddc-filter-converter_remove_overlap",
      "git@github.com:Shougo/ddc-filter-converter_truncate_abbr",
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
    "git@github.com:mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require("plugins.config.nvim-lint")
    end,
  },
  {
    "git@github.com:stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.config.conform")
    end,
  },
  {
    "git@github.com:mfussenegger/nvim-dap",
    dependencies = {
      "git@github.com:rcarriga/nvim-dap-ui",
      "git@github.com:mfussenegger/nvim-dap-python",
      "git@github.com:nvim-neotest/nvim-nio",
    },
    event = "LspAttach",
    config = function()
      require("plugins.config.nvim-dap")
    end,
  },
  {
    "git@github.com:nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
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
