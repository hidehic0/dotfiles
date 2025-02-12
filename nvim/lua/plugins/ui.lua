---@type LazySpec
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      vim.opt.laststatus = 3
      require("lualine").setup({})
    end,
  },
  {
    "folke/noice.nvim",
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
    "stevearc/oil.nvim",
    cmd = "Oil",
    -- keys = { { "<leader>e", "<CMD>Oil --float<CR>", desc = "start oil" } },
    config = function()
      require("plugins.config.oil")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VimEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.config.bufferline")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      triggers = {
        { "<leader>", mode = "n" },
        { "z", mode = "n" },
      },
    },
  },
  {
    "folke/trouble.nvim",
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
  { "MeanderingProgrammer/render-markdown.nvim", event = "VeryLazy" },
}
