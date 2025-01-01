return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      'nvim-treesitter/nvim-treesitter-refactor',
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "lua", "c" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
        },
        textobjects = {
          enable = true,
          set_jumps = true,
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_next_end = {
            ["[m"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        refactor = {
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr",
            },
          },
        }
      })
    end,
  },
}
