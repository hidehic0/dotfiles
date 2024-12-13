return {
  {
    "navarasu/onedark.nvim",
    enabled = false,
    lazy = true,
    event = "VimEnter",
    config = function()
      require("onedark").setup({
        style = "darker",
        transparent = true,
      })
      require("onedark").load()
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    event = "VimEnter",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
      })

      vim.cmd("colorscheme nightfox")
    end,
  },
}
