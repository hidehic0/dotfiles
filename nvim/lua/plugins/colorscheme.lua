return {
  {
    "EdenEast/nightfox.nvim",
    event = { "BufReadPre", "BufWinEnter", "BufEnter" },
    config = function()
      require("plugins.config.nightfox")
    end,
  },
}
