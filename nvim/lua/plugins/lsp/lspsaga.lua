return {
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      vim.opt.signcolumn = "yes"
      require("lspsaga").setup({
        show_code_action = false,
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    event = "LspAttach",
  },
}
