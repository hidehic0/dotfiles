-- lua_source {{{
require("obsidian").setup({
  legacy_commands = false,
  workspaces = {
    { name = "main", path = "~/src/github.com/hidehic0/obsidain_vault" },
  },
  daily_notes = {
    folder = "dailies",
  },
  note_id_func = function(title)
    -- 参考: https://zenn.dev/mimikun/articles/using-obsidian-nvim
    local prefix = tostring(os.time())
    local suffix = ""

    if title ~= nil then
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end

    return prefix .. "-" .. suffix
  end,
})

vim.keymap.set("n", "<leader>oo", "<Cmd>Obsidian open<CR>")
-- }}}
