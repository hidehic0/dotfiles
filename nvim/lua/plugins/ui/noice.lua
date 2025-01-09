return {
  {
    "folke/noice.nvim",
    -- event = "VeryLazy",
    enabled = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        config = function()
          require("notify").setup({
            background_colour = "#000000",
          })
        end
      },
    },
    opts = {
    }
  }
}
