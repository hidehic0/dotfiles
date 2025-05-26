return {
  {
    "EdenEast/nightfox.nvim",
    event = { "VimEnter" },
    build = "NightfoxCompile",
    config = function()
      require("plugins.config.nightfox")
    end,
    enabled = true,
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   event = { "VimEnter" },
  --   config = function()
  --     require("plugins.config.onedark")
  --   end,
  -- },
}
