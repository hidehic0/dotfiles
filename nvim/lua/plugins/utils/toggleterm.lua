return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 10, -- ターミナルのサイズ
      open_mapping = [[<c-\>]], -- キーマッピング
      direction = "float",
    },
    keys = { [[<C-\>]], ":ToggleTerm<CR>" },
    cmd = "ToggleTerm",
  },
}
