return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "Shougo/ddc-source-lsp",
    },
    config = function()
      require("plugins/config/nvim-lspconfig")
    end
  },
  {
    "Shougo/ddc.vim",
    dependencies = {
      -- denops
      "vim-denops/denops.vim",
      -- ui
      "Shougo/ddc-ui-pum",
      "Shougo/pum.vim",
      -- sources
      "Shougo/ddc-source-lsp",
      "Shougo/ddc-source-around",
      -- sorters
      "tani/ddc-fuzzy",
      -- snip
      "hrsh7th/vim-vsnip",
    },
    event = {
      "CmdlineEnter",
      "CmdlineChanged",
      "InsertEnter",
      "TextChangedI",
      "TextChangedP",
      "TextChangedT",
    },
    config = function()
      require("plugins/config/ddc")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "VeryLazy" },
    build = ":TSUpdateSync",
  },
}
