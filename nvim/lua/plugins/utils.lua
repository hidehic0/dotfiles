---@type LazySpec
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    version = "*",
    opts = {},
  },
  {
    "Shougo/ddt.vim",
    event = "VeryLazy",
    dependencies = {
      "Shougo/ddt-ui-terminal",
    },
    config = function()
      require("plugins.config.ddt")
    end,
  },
  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim",
    },
    event = "VimEnter",
    config = function()
      require("plugins.config.skkeleton")
    end,
  },
  {
    "vim-jp/vimdoc-ja",
    event = "VeryLazy",
  },
  {
    "Shougo/ddu.vim",
    -- event = "VeryLazy",
    -- priority = 0,
    dependencies = {
      "vim-denops/denops.vim",
      -- ui
      "Shougo/ddu-ui-ff",
      "Shougo/ddu-ui-filer",
      -- sources
      "4513ECHO/ddu-source-emoji",
      "Shougo/ddu-source-action",
      "Shougo/ddu-source-file",
      "Shougo/ddu-source-file_rec",
      "Shougo/ddu-source-line",
      "Shougo/ddu-source-register",
      "kuuote/ddu-source-git_status",
      "kyoh86/ddu-source-git_branch",
      "kyoh86/ddu-source-git_log",
      "kyoh86/ddu-source-lazy_nvim",
      "matsui54/ddu-source-help",
      "shun/ddu-source-buffer",
      "shun/ddu-source-rg",
      "staticWagomU/ddu-source-patch_local",
      "uga-rosa/ddu-source-lsp",
      -- kinds
      "Shougo/ddu-kind-file",
      "Shougo/ddu-kind-word",
      -- filters
      "yuki-yano/ddu-filter-fzf",
      -- converters
      "uga-rosa/ddu-filter-converter_devicon",
      "kyoh86/ddu-filter-converter_hl_dir",
      -- commands
      "Shougo/ddu-commands.vim",
      -- columns
      "Shougo/ddu-column-filename",
      "tamago3keran/ddu-column-devicon_filename",
      -- sorters
      "Shougo/ddu-filter-sorter_alpha",
      -- helper
      "tani/vim-artemis",
      -- utils
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.config.ddu")
    end,
    keys = {
      { "<leader>ff", "<CMD>Ddu -name=file_rec<CR>", desc = "start ddu file_rec" },
      { "<leader>e", "<CMD>Ddu -name=filer<CR>", desc = "start ddu filer" },
      { "<leader>fg", "<CMD>Ddu -name=rg<CR>", desc = "start ddu ripgrep" },
      { "<leader>fr", "<CMD>Ddu -name=lines<CR>", desc = "start ddu line search" },
      { "<leader>fb", "<CMD>Ddu -name=buffer<CR>", desc = "start ddu buffer search" },
      { "<leader>fh", "<CMD>Ddu -name=help<CR>", desc = "start ddu help search" },
      { "<leader>fs", "<CMD>Ddu -name=git_branch<CR>", desc = "start ddu branch search" },
      { "<leader>ft", "<CMD>Ddu -name=patch_local<CR>", desc = "start patch_local search" },
      { "<leader>ca", "<CMD>Ddu -name=lsp_codeAction<CR>", desc = "open code actions" },
    },
  },
  {
    "lambdalisue/vim-gin",
    dependencies = {
      "vim-denops/denops.vim",
      "monaqa/tree-sitter-unifieddiff",
    },
    event = "VeryLazy",
    keys = {
      { "<leader>ga", "<CMD>Gin add -A<CR>", desc = "run Git add" },
      {
        "<leader>gd",
        [[ <CMD>split | GinDiff ++processor=delta\ --no-gitconfig\ --color-only<CR> ]],
        desc = "show Git diff",
      },
      {
        "<leader>gD",
        [[ <CMD>split | GinDiff ++processor=delta\ --no-gitconfig\ --color-only --cached<CR> ]],
        desc = "show Git diff cached",
      },
      {
        "<leader>gp",
        [[<CMD>lua vim.notify("run Git pull") <CR><CMD> Gin pull<CR>]],
        desc = "run Git pull",
      },
      {
        "<leader>gP",
        [[<CMD>lua vim.notify("run Git push") <CR><CMD> Gin push<CR>]],
        desc = "run Git push",
      },
      {
        "<leader>gc",
        [[<CMD>Gin commit<CR>]],
        desc = "Git commit",
      },
      {
        "<leader>gl",
        "<CMD>vsplit | wincmd l | GinLog --graph --oneline<CR>",
        desc = "show Git Log",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = {
          enabled = true,
          multi_line = false,
          search = { wrap = false },
          highlight = { backdrop = true, groups = { label = "", backdrop = "" } },
          jump = { register = false },
        },
      },
    },
    keys = {
      {
        "<leader>j",
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "FzfLua",
    config = function()
      require("plugins.config.fzf")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    keys = {
      { "<leader>gb", "<CMD>Gitsigns blame<CR>", desc = "Show Git blame" },
    },
    config = function()
      vim.defer_fn(function()
        require("gitsigns").setup()
      end, 3000)
    end,
  },
  {
    "xiyaowong/nvim-cursorword",
    event = "CursorMoved",
    config = function()
      vim.g.cursorword_disable_at_startup = true
      vim.g.cursorword_min_width = 3
      vim.g.cursorword_max_width = 20
      vim.cmd([[hi default CursorWord cterm=underline gui=underline]])
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "CmdlineEnter",
    config = function()
      require("plugins.config.hlslens")
    end,
  },
  {
    "lambdalisue/vim-kensaku",
    event = "VimEnter",
    dependencies = {
      "vim-denops/denops.vim",
      "lambdalisue/vim-kensaku-search",
    },
    config = function()
      vim.keymap.set("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>")
    end,
  },
  {
    "monaqa/dial.nvim",
    -- event = "VeryLazy",
    -- dependencies = {
    --   "nvim-lua/plenary.nvim",
    -- },
    config = function()
      require("plugins.config.dial")
    end,
    keys = {
      {
        "<C-a>",
        function()
          require("dial.map").manipulate("increment", "normal")
        end,
      },
      {
        "<C-x>",
        function()
          require("dial.map").manipulate("decrement", "normal")
        end,
      },
      {
        "g<C-a>",
        function()
          require("dial.map").manipulate("increment", "gnormal")
        end,
      },
      {
        "g<C-x>",
        function()
          require("dial.map").manipulate("decrement", "gnormal")
        end,
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
  },
}
