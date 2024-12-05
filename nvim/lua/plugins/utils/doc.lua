return {
  {
    "vim-jp/vimdoc-ja",
    config = function()
      vim.cmd([[set helplang=ja,en]])
    end,
    keys = {
      { "h", mode = "c" },
    },
  },
}
