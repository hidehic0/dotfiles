local fn = require("artemis").fn
local patch_global = fn.ddc.custom.patch_global

vim.fn["ddc#custom#load_config"](vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins", "config", "ddc.ts"))

-- vsnip
vim.g.vsnip_snippet_dir = "~/.config/nvim/vsnip"

-- pum config
fn.pum.set_option({
  max_width = 40,
  direction = "below",
})

local pum_next = function()
  fn.pum.map.insert_relative(1, "loop")
end

local pum_back = function()
  fn.pum.map.insert_relative(-1, "loop")
end

local pum_confirm = function()
  fn.pum.map.confirm()
end

local pum_cansel = function()
  fn.pum.map.cancel()
end

-- vim.keymap.set("i", "<C-l>", function()
--   if fn.vsnip.jumpable(1) == 1 then
--     vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-next)", true, true, true), "n")
--   end
-- end)

vim.keymap.set("i", "<Tab>", function()
  if fn.pum.visible() then
    pum_next()
  elseif fn.vsnip.jumpable(1) == 1 then
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-next)", true, true, true), "i")
  else
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
  end
end)

vim.keymap.set("i", "<S-Tab>", function()
  if fn.pum.visible() then
    pum_back()
  elseif fn.vsnip.jumpable(-1) == 1 then
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "i")
  else
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-d>", true, true, true), "n")
  end
end)

vim.keymap.set("i", "<C-n>", pum_next)
vim.keymap.set("i", "<C-p>", pum_back)
vim.keymap.set("i", "<C-y>", pum_confirm)
vim.keymap.set("i", "<C-e>", pum_cansel)

vim.cmd([[
nnoremap :       <Cmd>call CommandlinePre()<CR>:
function! CommandlinePre() abort
cnoremap <Tab>   <Cmd>call pum#map#insert_relative(+1, "loop")<CR>
cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1, "loop")<CR>
cnoremap <C-n>   <Cmd>call pum#map#select_relative(+1, "loop")<CR>
cnoremap <C-p>   <Cmd>call pum#map#select_relative(-1, "loop")<CR>
cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
autocmd User DDCCmdlineLeave ++once call CommandlinePost()
call ddc#enable_cmdline_completion()
endfunction
function! CommandlinePost() abort
silent! cunmap <Tab>
silent! cunmap <S-Tab>
silent! cunmap <C-e>
endfunction
]])

pcall(function()
  vim.cmd("LspStart")
end)

fn.ddc.enable()
fn.ddc.enable_terminal_completion()

vim.notify("ddc.vim loaded successfully")
