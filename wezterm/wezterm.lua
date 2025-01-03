local wezterm = require 'wezterm'
local keymaps = require 'keymaps'

local config = wezterm.config_builder()
config.automatically_reload_config = true

config.font = wezterm.font_with_fallback { 'Hack Nerd Font', 'HackGen35ConsoleNF ', 'Noto Color Emoji' }
config.webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1]

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keymaps.keys
config.enable_wayland = true

return config
