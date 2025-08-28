require("obsidian").setup({
  legacy_commands = false,
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
})
