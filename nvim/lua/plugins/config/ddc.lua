local fn = require("artemis").fn
local keymaps_set = require("utils").keymaps_set

vim.fn["ddc#custom#load_config"](vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins", "config", "ddc.ts"))

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

keymaps_set({
  {
    mode = "i",
    lhs = "<Tab>",
    rhs = function()
      if fn.pum.visible() then
        pum_next()
      elseif fn.denippet.jumpable(1) then
        fn.denippet.jump(1)
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
      end
    end,
  },
  {
    mode = "i",
    lhs = "<S-Tab>",
    rhs = function()
      if fn.pum.visible() then
        pum_back()
      elseif fn.denippet.jumpable(-1) then
        fn.denippet.jump(-1)
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-d>", true, true, true), "n")
      end
    end,
  },
  {
    mode = "i",
    lhs = "<C-n>",
    rhs = pum_next,
  },
  {
    mode = "i",
    lhs = "<C-p>",
    rhs = pum_back,
  },
  { mode = "i", lhs = "<C-y>", rhs = pum_confirm },
  { mode = "i", lhs = "<C-e>", rhs = pum_cansel },
})

vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
  pattern = "*",
  callback = function()
    keymaps_set({
      {
        mode = "c",
        lhs = "<Tab>",
        rhs = pum_next,
      },
      {
        mode = "c",
        lhs = "<S-Tab>",
        rhs = pum_back,
      },
      {
        mode = "c",
        lhs = "<C-n>",
        rhs = pum_next,
      },
      {
        mode = "c",
        lhs = "<C-p>",
        rhs = pum_back,
      },
      {
        mode = "c",
        lhs = "<C-e>",
        rhs = pum_cansel,
      },
      {
        mode = "c",
        lhs = "<C-y>",
        rhs = pum_confirm,
      },
    })
    vim.fn["ddc#enable_cmdline_completion"]()

    vim.api.nvim_create_autocmd({ "CmdlineLeavePre" }, {
      pattern = "*",
      once = true,
      callback = function()
        for _, key in ipairs({ "<Tab>", "<S-Tab>", "<C-n>", "<C-p>", "<C-e>", "<C-y>" }) do
          vim.keymap.del("c", key, { silent = true })
        end
      end,
    })
  end,
})

-- vim.cmd([[
-- nnoremap :       <Cmd>call CommandlinePre()<CR>:
-- function! CommandlinePre() abort
-- cnoremap <Tab>   <Cmd>call pum#map#insert_relative(+1, "loop")<CR>
-- cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1, "loop")<CR>
-- cnoremap <C-n>   <Cmd>call pum#map#select_relative(+1, "loop")<CR>
-- cnoremap <C-p>   <Cmd>call pum#map#select_relative(-1, "loop")<CR>
-- cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
-- cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
-- autocmd User DDCCmdlineLeave ++once call CommandlinePost()
-- call ddc#enable_cmdline_completion()
-- endfunction
-- function! CommandlinePost() abort
-- silent! cunmap <Tab>
-- silent! cunmap <S-Tab>
-- silent! cunmap <C-e>
-- endfunction
-- ]])

fn.ddc.enable()
fn.ddc.enable_terminal_completion()

vim.notify("ddc.vim loaded successfully")
