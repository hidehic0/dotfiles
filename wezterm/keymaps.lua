local M = {}
local wezterm = require("wezterm")
local act = wezterm.action

M.keys = {
  -- tab move keybinds
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
  -- pane move keybinds
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left")
  },
  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right")
  },
  {
    key = "u",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up")
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down")
  },
}

return M
