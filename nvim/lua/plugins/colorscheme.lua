return {
  {
    "EdenEast/nightfox.nvim",
    event = { "BufReadPre", "BufWinEnter", "BufEnter" },
    config = function()
      require("plugins.config.nightfox")
    end,
    enabled = false,
  },
  {
    "navarasu/onedark.nvim",
    event = { "VimEnter" },
    config = function()
      require("plugins.config.onedark")
    end,
  },
}
