---@type LazySpec
return {
  {
    "vim-denops/denops.vim",
    dependencies = {
      {
        "yuki-yano/denops-lazy.nvim",
        opts = {
          wait_load = false,
        },
      },
    },
    event = { "VeryLazy" },
    priority = 0,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "CursorMoved",
    opts = {},
  },
  -- {
  --   "Shougo/ddt.vim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "Shougo/ddt-ui-terminal",
  --   },
  --   config = function()
  --     require("plugins.config.ddt")
  --   end,
  -- },
  {
    "Shougo/deol.nvim",
    dependencies = {
      "tani/vim-artemis",
    },
    event = "VeryLazy",
    config = function()
      require("plugins.config.deol")
    end,
  },
  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim",
      "yuki-yano/denops-lazy.nvim",
    },
    event = { "CmdlineEnter", "InsertEnter" },
    config = function(spec)
      require("denops-lazy").load(spec.name)
      require("plugins.config.skkeleton")
    end,
  },
  {
    "vim-jp/vimdoc-ja",
    event = "VeryLazy",
    priority = 0,
  },
  {
    "Shougo/ddu.vim",
    event = "VeryLazy",
    priority = 0,
    dependencies = {
      "vim-denops/denops.vim",
      "yuki-yano/denops-lazy.nvim",
      -- ui
      "Shougo/ddu-ui-ff",
      "Shougo/ddu-ui-filer",
      -- sources
      "4513ECHO/ddu-source-emoji",
      "Shougo/ddu-source-action",
      "Shougo/ddu-source-file",
      "Shougo/ddu-source-file_rec",
      "Shougo/ddu-source-line",
      -- "Shougo/ddu-source-register",
      "kuuote/ddu-source-git_status",
      "kyoh86/ddu-source-git_branch",
      -- "kyoh86/ddu-source-git_log",
      -- "kyoh86/ddu-source-lazy_nvim",
      "matsui54/ddu-source-help",
      -- "shun/ddu-source-buffer",
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
    config = function(spec)
      require("denops-lazy").load(spec.name)
      vim.defer_fn(function()
        require("plugins.config.ddu")
      end, 500)
    end,
  },
  {
    "tpope/vim-fugitive",
    -- event = "VeryLazy",
    cmd = { "Git" },
    keys = {
      { "<leader>ga", "<CMD>Git add -A<CR>", desc = "run Git add" },
      {
        "<leader>gd",
        "<CMD>Git diff HEAD<CR>",
        desc = "show Git diff",
      },
      {
        "<leader>gp",
        [[<CMD>lua vim.notify("run Git pull") <CR><CMD> Git pull<CR>]],
        desc = "run Git pull",
      },
      {
        "<leader>gP",
        [[<CMD>lua vim.notify("run Git push") <CR><CMD> Git push<CR>]],
        desc = "run Git push",
      },
      {
        "<leader>gc",
        [[<CMD>Git commit<CR>]],
        desc = "Git commit",
      },
      {
        "<leader>gl",
        "<CMD>Git log --graph --oneline<CR>",
        desc = "show Git Log",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "CursorMoved",
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
    "yuki-yano/fuzzy-motion.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "yuki-yano/denops-lazy.nvim",
      "lambdalisue/kensaku.vim",
    },
    cmd = { "FuzzyMotion" },
    init = function()
      vim.g.fuzzy_motion_matchers = { "fzf", "kensaku" }
    end,
    config = function(spec)
      require("denops-lazy").load(spec.name)
    end,
  },
  -- {
  --   "ibhagwan/fzf-lua",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   cmd = "FzfLua",
  --   config = function()
  --     require("plugins.config.fzf")
  --   end,
  -- },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "CursorHold", "CursorHoldI" },
    keys = {
      { "<leader>gb", "<CMD>Gitsigns blame<CR>", desc = "Show Git blame" },
    },
    opts = {},
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
    event = "CmdlineEnter",
    dependencies = {
      "vim-denops/denops.vim",
      "lambdalisue/vim-kensaku-search",
      "yuki-yano/denops-lazy.nvim",
    },
    config = function(spec)
      require("denops-lazy").load(spec.name)
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
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = "cd app && yarn install",
  -- },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    config = function()
      require("hardtime").setup({
        disabled_filetypes = { "ddu-ff" },
        timeout = 10000,
        enabled = vim.g.hardtime_enabled,
      })
    end,
  },
  {
    "obsidian-nvim/obsidian.nvim",
    ft = "markdown",
    cmd = {
      "Obsidian",
      "ObsidianOpen",
      "ObsidianKensaku",
      "ObsidianQuickKensaku",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "fdschmidt93/telescope-egrepify.nvim",
      {
        "delphinus/obsidian-kensaku.nvim",
        branch = "feat/quick-kensaku",
        dependencies = { "lambdalisue/kensaku.vim" },
        opts = { picker = "egrepify" },
      },
      {
        "oflisback/obsidian-bridge.nvim",
        opts = {
          scroll_sync = true,
        },
      },
    },
    opts = {
      workspaces = {
        { name = "main", path = "~/src/github.com/hidehic0/obsidain_vault" },
      },
      daily_notes = {
        folder = "dailies",
      },
      callbacks = {
        post_setup = function(client)
          require("obsidian-kensaku")(client)
        end,
      },
    },
  },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "vyfor/cord.nvim", build = ":Cord update", event = "VeryLazy", priority = 0, opts = {}, cond = false },
}
