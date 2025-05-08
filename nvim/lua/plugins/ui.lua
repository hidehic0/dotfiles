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
  -- {
  --   "j-hui/fidget.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
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
  {
    "DanilaMihailov/beacon.nvim",
    event = "VeryLazy",
    opts = {
      fps = 144,
      speed = 1,
      min_jump = 4,
      highlight = { bg = "blue", ctermbg = 15 },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      require("ibl").setup({ indent = { highlight = highlight } })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        options = {
          enable_on_insert = true,
          overwrite_events = { "DiagnosticChanged" },
          multilines = {
            enabled = true,
            always_show = true,
          },
        },
      })
      vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        update_in_insert = true,
        underline = true,
      }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
}
