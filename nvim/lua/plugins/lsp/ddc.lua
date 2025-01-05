return {
  {
    "Shougo/ddc.vim",
    dependencies = {
      -- denops
      "vim-denops/denops.vim",
      -- sources
      "LumaKernel/ddc-source-file",
      "Shougo/ddc-source-around",
      "Shougo/ddc-source-cmdline",
      "Shougo/ddc-source-lsp",
      "uga-rosa/ddc-source-nvim-lua",
      -- ui
      "Shougo/ddc-ui-native",
      "Shougo/ddc-ui-pum",
      "Shougo/pum.vim",
      "tani/ddc-fuzzy",

      -- filters
      "Shougo/ddc-converter_remove_overlap",
      "Shougo/ddc-filter-sorter_rank"

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
      local patch_global = vim.fn["ddc#custom#patch_global"]
      local patch_filetype = vim.fn["ddc#custom#patch_filetype"]
      patch_global("ui", { "pum" })
      patch_global("autoCompleteEvents", {
        "CmdlineEnter",
        "CmdlineChanged",
        "InsertEnter",
        "TextChangedI",
        "TextChangedP",
        "TextChangedT",
      })

      patch_global("sources", { "lsp", "file" })

      -- lua config
      patch_filetype("lua", {
        sources = {
          "lsp", "nvim-lua"
        }
      })

      patch_global("cmdlineSources", {
        [":"] = {
          "cmdline",
          "around",
        },
        ["/"] = {
          "around",
        },
        ["?"] = {
          "around",
        },
      })

      patch_global("sourceOptions", {
        _ = {
          matchers = { "matcher_fuzzy" },
          sorters = { "sorter_rank" },
          converters = { "converter_fuzzy" },
        },
        lsp = {
          mark = "[LSP]",
          dup = "force",
          forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
          sorters = { "sorter_lsp-kind", "sorter_fuzzy" },
        },
        cmdline = {
          mark = "[CMD]",
        },
        file = {
          mark = "[F]",
          forceCompletionPattern = [[\S/\S*]],
        },
        ["nvim-lua"] = {
          mark = "",
          forceCompletionPattern = "\\.\\w*",
        },
      })


      vim.cmd([[
        set wildoptions+=pum
        inoremap <silent><expr> <TAB>
          \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
          \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
          \ '<TAB>' : ddc#map#manual_complete()
        inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
        inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
        inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
        nnoremap :       <Cmd>call CommandlinePre()<CR>:

        function! CommandlinePre() abort
          cnoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
          cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
          cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
          autocmd User DDCCmdlineLeave ++once call CommandlinePost()
          call ddc#enable_cmdline_completion()
        endfunction
        function! CommandlinePost() abort
            silent! cunmap <Tab>
            silent! cunmap <S-Tab>
            silent! cunmap <C-e>
        endfunction
      ]])
      vim.fn["ddc#enable_terminal_completion"]()
      vim.fn["ddc#enable"]()
    end,
  },
}
