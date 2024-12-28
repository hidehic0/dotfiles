local M = {}
local wezterm = require("wezterm")
local act = wezterm.action

M.keys = {
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = "n",
    mods = "LEADER",
    action = act.ActivateTabRelative(1)
  },
  {
    key = "N",
    mods = "LEADER",
    action = act.ActivateTabRelative(-1)
  },
}

return M
