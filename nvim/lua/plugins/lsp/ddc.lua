return {
  {
    "Shougo/ddc.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc-source-around",
      "Shougo/ddc-ui-native",
      "tani/ddc-fuzzy",
      "Shougo/ddc-source-lsp",
      -- "Shougo/ddc-sorter_rank",
      "Shougo/ddc-converter_remove_overlap",
      {
        "Shougo/pum.vim",
        config = function()
          -- insert keybindings
          vim.cmd([[
inoremap <silent><expr> <TAB>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

cnoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
    cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
          ]])
        end,
      },
      "Shougo/ddc-ui-pum",
      "Shougo/ddc-source-cmdline",
    },
    event = "InsertEnter",
    config = function()
      local patch_global = vim.fn["ddc#custom#patch_global"]
      patch_global("ui", { "pum" })
      patch_global("autoCompleteEvents", {
        "InsertEnter",
        "TextChangedI",
        "TextChangedP",
        "CmdlineChanged",
      })
      patch_global("cmdlineSources", {
        "cmdline",
      })
      patch_global("sources", { "lsp" })
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
          sorters = { "sorter_fuzzy" },
          converters = { "converter_fuzzy", "converter_remove_overlap" },
        },
        lsp = {
          mark = "lsp",
          dup = "keep",
          forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
          sorters = { "sorter_lsp-kind", "sorter_fuzzy" },
        },
        cmdline = {
          mark = "[CMD]",
        },
      })
      vim.fn["ddc#enable"]()
    end,
  },
}
