return {
  {
    "git@github.com:nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({})
    end,
  },
  {
    "git@github.com:folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        signature = { enabled = false },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
        progress = {
          enabled = false,
        },
      },
      messages = {
        enabled = false,
      },
    },
  },
  {
    "git@github.com:stevearc/oil.nvim",
    cmd = "Oil",
    keys = { { "<leader>e", "<CMD>Oil --float<CR>", desc = "start oil" } },
    config = function()
      require("plugins.config.oil")
    end,
  },
  {
    "git@github.com:akinsho/bufferline.nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.config.bufferline")
    end,
  },
  {
    "git@github.com:folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      triggers = {
        { "<leader>", mode = "n" },
      },
    },
  },
  {
    "git@github.com:folke/trouble.nvim",
    event = "VeryLazy",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>x",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
  },
  {
    "git@github.com:j-hui/fidget.nvim.git",
    event = "VeryLazy",
    opts = {},
  },
  {
    "git@github.com:folke/todo-comments.nvim.git",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
    keys = { { "<leader>t", "<CMD>TodoLocList<CR>", desc = "Show TODOS" } },
  },
}
