return {
  {
    "git@github.com:EdenEast/nightfox.nvim",
    event = { "BufReadPre", "BufWinEnter", "BufEnter" },
    config = function()
      require("plugins.config.nightfox")
    end,
    enabled = false,
  },
  {
    "git@github.com:navarasu/onedark.nvim",
    event = { "BufReadPre", "BufWinEnter", "BufEnter" },
    config = function()
      require("plugins.config.onedark")
    end,
  },
}
