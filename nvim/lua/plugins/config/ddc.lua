local fn = require("artemis").fn
local patch_global = fn.ddc.custom.patch_global

patch_global("autoCompleteEvents", {
  "InsertEnter",
  "TextChangedI",
  "TextChangedP",
  "CmdlineChanged",
})

patch_global("sources", { "lsp", "skkeleton" })
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
    sorters = { "sorter_fuzzy" },
    matchers = { "matcher_fuzzy" },
    converters = { "converter_fuzzy" },
  },
  lsp = {
    mark = "[LSP]",
    forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
  },
  cmdline = {
    mark = "[CMD]",
  },
  around = {
    mark = "A",
  },
  skkeleton = {
    mark = "あ",
    matchers = {},
    sorters = {},
    converters = {},
    isVolatile = true,
    minAutoCompleteLength = 1,
  },
  copilot = {
    mark = "",
    matchers = {},
    minAutoCompleteLength = 0,
  },
})

patch_global("sourceParams", {
  lsp = {
    snippetEngine = vim.fn["denops#callback#register"](function(body)
      vim.fn["vsnip#anonymous"](body)
    end),
    enableResolveItem = true,
    enableAdditionalTextEdit = true,
  },
  ["shell-native"] = {
    shell = "zsh",
  },
})

patch_global("ui", "pum")

-- pum config
fn.pum.set_option({
  border = "rounded",
  max_width = 40,
})

vim.cmd([[
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

fn.ddc.enable_terminal_completion()
fn.ddc.enable()
