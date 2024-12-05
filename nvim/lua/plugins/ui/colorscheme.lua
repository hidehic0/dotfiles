return {
  {
    "navarasu/onedark.nvim",
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
}
