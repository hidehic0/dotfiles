return {
  "Shougo/ddu.vim",
  dependencies = {
    "vim-denops/denops.vim",
    "Shougo/ddu-filter-matcher_substring",
    "Shougo/ddu-source-file_rec",
    "Shougo/ddu-ui-ff",
    "Shougo/ddu-kind-file",
    "uga-rosa/ddu-filter-converter_devicon",
    "shun/ddu-source-rg",
    "Shougo/ddu-commands.vim",
    "uga-rosa/ddu-source-lsp",
  },

  config = function()
    vim.fn["ddu#custom#patch_global"]({
      ui = "ff",
      uiParams = {
        ff = {
          startAutoAction = true,
          autoAction = {
            delay = 0,
            name = "preview",
          },

          winRow = "(&lines - min([70, &lines - 8]) - 3) / 2",
          previewRow = "(&lines - min([70, &lines - 8]) - 3) / 2",

          winHeight = "min([70, &lines - 8])",
          previewHeight = "min([70, &lines - 8])",

          winCol = "&columns / 10",
          previewCol = "&columns / 2",

          winWidth = "&columns * 4 / 10 - 2",
          previewWidth = "&columns * 4 / 10 - 2",
          -- <<< sizes

          onPreview = vim.fn["denops#callback#register"](function(args)
            vim.wo[args.previewWinId].cursorline = false
          end),
          split = "floating",
          floatingBorder = "rounded",
          prompt = "󰈲  ",
          highlights = {
            filterText = "dduFilter",
            floating = "Normal",
            floatingCursorLine = "dduCursorLine",
            floatingBorder = "dduBorder",
            prompt = "dduPrompt",
          },
          previewFloating = true,
          previewFloatingBorder = "single",
          previewSplit = "vertical",
          previewWindowOptions = {
            { "&signcolumn", "no" },
            { "&foldcolumn", 0 },
            { "&foldenable", 0 },
            { "&number", 0 },
            { "&wrap", 0 },
            { "&scrolloff", 0 },
          },
        },
      },
      sourceOptions = {
        _ = {
          matchers = {
            "matcher_substring",
          },
          converters = {
            "converter_devicon",
          },
          ignoreCase = true,
        },
        rg = {
          defaultAction = "open",
        },
        file_rec = {
          defaultAction = "open",
        },
        lsp_codeAction = {},
      },
      sourceParams = {
        rg = {
          args = { "--ignore-case", "--column", "--no-heading", "--color", "never" },
        },
      },
      kindOptions = {
        lsp = { defaultAction = "open" },
        lsp_codeAction = { defaultAction = "apply" },
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ddu-ff",
      callback = function()
        local opts = { noremap = true, silent = true, buffer = true }
        vim.keymap.set({ "n" }, "q", [[<Cmd>call ddu#ui#do_action("quit")<CR>]], opts)
        vim.keymap.set({ "n" }, "<Cr>", [[<Cmd>call ddu#ui#do_action("itemAction")<CR>]], opts)
        vim.keymap.set({ "n" }, "i", [[<Cmd>call ddu#ui#do_action("openFilterWindow")<CR>]], opts)
      end,
    })
  end,

  keys = {
    { "<leader>ff", "<Cmd>Ddu file_rec<CR>" },
    { "<leader>fg", "<Cmd>DduRg<CR>" },
  },
  event = "VeryLazy",
}
