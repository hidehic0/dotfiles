return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
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
      },
      messages = {
        enabled = false,
      },
    },
  },
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = { { "<leader>e", "<CMD>Oil --float<CR>", desc = "start oil" } },
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
      },
    },
  },
  {
    "isakbm/gitgraph.nvim",
    opts = {
      format = {
        timestamp = "%H:%M:%S %Y-%m-%d",
        fields = { "hash", "timestamp", "author", "branch_name", "tag" },
      },
      hooks = {
        on_select_commit = function(commit)
          print("selected commit:", commit.hash)
        end,
        on_select_range_commit = function(from, to)
          print("selected range:", from.hash, to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          vim.cmd("vsplit")
          vim.cmd("wincmd l")
          vim.cmd("vertical resize 95")
          require("gitgraph").draw({}, { max_count = 5000, all = true })
        end,
        desc = "GitGraph - Draw",
      },
    },
  },
}
