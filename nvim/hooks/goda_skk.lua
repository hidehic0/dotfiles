-- lua_source {{{
vim.g["goda_skk#config_dir"] = vim.fn.expand("$HOOK_DIR/goda-skk")

vim.keymap.set({ "i", "c" }, "<C-j>", function()
  vim.fn["goda_skk#enable"]()
end)

vim.api.nvim_create_autocmd({ "InsertLeavePre", "CmdlineLeavePre" }, {
  pattern = "*",
  callback = function()
    vim.fn["goda_skk#disable"]()
  end,
})

vim.fn["goda_skk#state_popup#config"]({
  labels = {
    input = {
      hira = "あ",
      kata = "ア",
      hankana = "ｶﾅ",
    },
    ["input:okurinasi"] = {
      hira = "▽",
      kana = "▽",
      hankana = "▽",
      abbrev = "ab",
    },
    ["input:okuriari"] = {
      hira = "▽",
      kana = "▽",
      hankana = "▽",
    },
    ["henkan"] = {
      hira = "▼",
      kana = "▼",
      hankana = "▼",
      abbrev = "ab",
    },
  },
})
vim.fn["goda_skk#popup#config"]({ opts = { border = "rounded" } })

vim.api.nvim_set_hl(0, "GodaSkkHenkan", {
  underline = true,
})
vim.api.nvim_set_hl(0, "GodaSkkHenkanSelect", {
  underline = true,
  reverse = true,
})

vim.fn["goda_skk#state_popup#enable"]()
-- }}}
