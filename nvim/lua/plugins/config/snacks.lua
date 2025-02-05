require("snacks").setup({
  dashboard = {
    enabled = true,
    width = 60,
    row = nil,
    col = nil,
    pane_gap = 4,
    autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",

    preset = {
      ---@type snacks.dashboard.Item[]
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = [[:call ddu#start(#{name: "file_rec"})]] },
        { icon = " ", key = "g", desc = "Find Text", action = ":call ddu#start(#{name: 'rg'})" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = "", key = "N", desc = "Check the neovim.io", action = ":!xdg-open https://neovim.io" },
        { icon = "", key = "c", desc = "Checkhealth", action = ":checkhealth" },
        { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
      header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    },

    sections = { { section = "header" }, { section = "keys", gap = 1, padding = 1 } },
  },
})
