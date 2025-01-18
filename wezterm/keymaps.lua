local M = {}
local wezterm = require("wezterm")
local act = wezterm.action

M.keys = {
  -- tab move keybinds
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "n",
    mods = "LEADER",
    action = act.ActivateTabRelative(1),
  },
  {
    key = "N",
    mods = "LEADER",
    action = act.ActivateTabRelative(-1),
  },
  -- pane move keybinds
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down"),
  },
  --  pane create keybinds
  { key = "%", mods = "LEADER|SHIFT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
  { key = '"', mods = "LEADER|SHIFT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

  -- copy mode setting
  {
    key = "[",
    mods = "LEADER",
    action = act.ActivateCopyMode,
  },
}

return M
