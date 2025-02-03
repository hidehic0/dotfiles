local fn = require("artemis").fn
local patch_global = fn.ddc.custom.patch_global

vim.fn["ddc#custom#load_config"](vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins", "config", "ddc.ts"))

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

vim.notify("ddc.vim loaded successfully")
