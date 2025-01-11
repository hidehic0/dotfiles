return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = { "BufReadPre", "BufWinEnter", "BufEnter" },
    config = function()
      require("plugins/config/catppuccin")
    end
  }
}
