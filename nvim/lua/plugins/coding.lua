vim.g.copilot_no_tab_map = true
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
    dependencies = {
      "Shougo/ddc-source-lsp",
    },
    config = function()
      vim.lsp.config("*", { capabilities = require("ddc_source_lsp").make_client_capabilities() })
      vim.lsp.enable({ "lua_ls", "pyright", "ruff", "clangd", "denols", "marksman" })
    end,
  },
  -- {
  --   "nvimdev/lspsaga.nvim",
  --   event = "LspAttach",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("plugins.config.lspsaga")
  --   end,
  -- },
  {
    "matsui54/denops-popup-preview.vim",
    dependencies = {
      "vim-denops/denops.vim",
    },
    event = "VeryLazy",
    config = function()
      vim.fn["popup_preview#enable"]()
    end,
  },
  {
    "matsui54/denops-signature_help",
    dependencies = {
      "vim-denops/denops.vim",
    },
    event = "VeryLazy",
    config = function()
      vim.g.signature_help_config = {
        contentsStyle = "full",
        viewStyle = "floating",
      }
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
      "LumaKernel/ddc-source-file",
      "Shougo/ddc-source-around",
      "Shougo/ddc-source-cmdline",
      "Shougo/ddc-source-cmdline_history",
      "Shougo/ddc-source-copilot",
      "Shougo/ddc-source-lsp",
      "Shougo/ddc-source-mocword",
      "Shougo/ddc-source-rg",
      "Shougo/ddc-source-shell-native",
      "uga-rosa/ddc-source-vsnip",
      -- sorters
      "tani/ddc-fuzzy",
      -- converters
      "Shougo/ddc-filter-converter_remove_overlap",
      "Shougo/ddc-filter-converter_truncate_abbr",
      -- filters
      "Shougo/ddc-filter-matcher_prefix",
      -- snip
      "hrsh7th/vim-vsnip",

      -- helper
      "tani/vim-artemis",
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
    -- event = "VeryLazy",
    keys = {
      { "<F5>", "<CMD>DapContinue<CR>", desc = "Start/Continue Debugging" },
      { "<leader>b", "<CMD>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
    },
    config = function()
      require("plugins.config.nvim-dap")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "yioneko/nvim-yati",
      "JoosepAlviste/nvim-ts-context-commentstring",
      { "andersevenrud/nvim_context_vt", event = "VeryLazy", opts = {} },
    },
    event = "VeryLazy",
    build = { ":TSUpdateSync" },
    config = function()
      require("plugins.config.treesitter")
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    config = function()
      vim.defer_fn(function()
        if vim.fn.expand("%:p") ~= "" then
          vim.cmd.edit({ bang = true })
        end
      end, 300)
    end,
  },
  {
    "tani/dmacro.nvim",
    event = { "CursorMoved", "InsertEnter" },
    config = function()
      vim.keymap.set({ "i", "n" }, "<C-.>", "<Plug>(dmacro-play-macro)")
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      pre_hook = function()
        return require("ts_context_commentstring.internal").calculate_commentstring()
      end,
    },
  },
  {
    "github/copilot.vim",
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    config = function()
      vim.keymap.set("i", "<C-CR>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "LspAttach",
    opts = {},
  },
  { "kosayoda/nvim-lightbulb", event = "LspAttach", opts = {
    autocmd = { enabled = true },
  } },
}
