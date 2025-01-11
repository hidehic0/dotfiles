return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({})
    end
  },
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {{"<leader>e","<CMD>Oil --float<CR>"}},
    config = function ()
      require("plugins.config.oil")
    end
  },
  {
    "akinsho/bufferline.nvim",
    event = "VimEnter",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require("plugins.config.bufferline")
    end
  }
}
