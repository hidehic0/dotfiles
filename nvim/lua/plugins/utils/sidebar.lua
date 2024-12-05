return {
  {
    "sidebar-nvim/sidebar.nvim",
    event = "VeryLazy",
    config = function()
      local sidebar = require("sidebar-nvim")
      local opts = { open = false }
      sidebar.setup(opts)
      vim.api.nvim_set_keymap(
        "n",
        "<leader>z",
        ":lua require('sidebar-nvim').toggle()<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
