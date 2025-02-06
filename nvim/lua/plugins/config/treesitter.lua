require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  },
  incremental_selection = {
    enable = true,
  },
  refactor = {
    navigation = {
      enable = true,
    },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
  yati = { enable = true, default_lazy = true },
})
