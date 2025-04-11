---@type LazySpec
return {
  {
    "nvim-lualine/lualine.nvim",
    -- event = { "BufReadPost", "BufAdd", "BufNewFile" },
    event = "VimEnter",
    dependencies = {
      { "yavorski/lualine-macro-recording.nvim" },
      "pnx/lualine-lsp-status",
    },
    config = function()
      require("lualine").setup({
        sections = {
          -- add to section of your choice
          lualine_c = { "lsp-status", "macro_recording", "%S" },
        },
      })
    end,
  },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     -- "rcarriga/nvim-notify",
  --   },
  --   opts = {
  --     presets = {
  --       command_palette = true,
  --     },
  --     lsp = {
  --       signature = { enabled = false },
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --       },
  --       progress = {
  --         enabled = false,
  --       },
  --     },
  --     messages = {
  --       enabled = false,
  --     },
  --   },
  -- },
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    -- keys = { { "<leader>e", "<CMD>Oil --float<CR>", desc = "start oil" } },
    config = function()
      require("plugins.config.oil")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.config.bufferline")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      triggers = {
        { "<leader>", mode = "n" },
        { "z", mode = { "n", "x" } },
        { "g", mode = { "n", "x" } },
        { "<C-w>", mode = "n" },
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
    keys = {
      {
        "<leader>x",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
    keys = { { "<leader>t", "<CMD>TodoLocList<CR>", desc = "Show TODOS" } },
  },
  { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown" } },
  {
    "nvim-zh/colorful-winsep.nvim",
    event = "WinNew",
    opts = {},
  },
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("plugins.config.scrollbar")
    end,
  },
  { "folke/zen-mode.nvim", opts = {}, cmd = "ZenMode" },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        stages = "slide",
        fps = 144,
        icons = {
          ERROR = " ERROR",
          WARN = " WARN",
          INFO = " INFO",
          DEBUG = " DEBUG",
          TRACE = "✎ TRACE",
        },
      })
      vim.notify = require("notify")
    end,
  },
  { "Sam-programs/cmdline-hl.nvim", event = "VeryLazy", opts = {
    ghost_text = false,
  } },
}
