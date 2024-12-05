return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      --      vim.keymap.set("n", "g", "t", "<Cmd>BufferLineCycleNext<CR>", {})
      --     vim.keymap.set("n", "g", "T", "<Cmd>BufferLineCyclePrev<CR>", {})
      local bufferline = require("bufferline")
      require("bufferline").setup({
        options = {
          -- mode = "tabs",
          style_preset = bufferline.style_preset.minimal,
          always_show_bufferline = false,
          color_icons = true,
          diagnostics = "nvim_lsp",
        },
      })

      vim.api.nvim_set_keymap("n", "gt", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
      -- 前のバッファへ移動
      vim.api.nvim_set_keymap("n", "gT", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
      -- バッファを削除
      vim.api.nvim_set_keymap("n", "<leader>q", ":bdelete<CR>", { noremap = true, silent = true })
    end,
  },
}
