return {
  {
    "numToStr/Comment.nvim",
    event = { "CursorHold", "CursorHoldI" },
    opts = {
      -- ad
      opleader = {
        ---Line-comment keymap
        line = "gc",
        ---Block-comment keymap
        block = "gb",
      },
    },
  },
}
