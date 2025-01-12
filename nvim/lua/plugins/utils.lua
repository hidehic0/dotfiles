return {
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
    "Shougo/deol.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.config.deol")
    end,
  },
}
