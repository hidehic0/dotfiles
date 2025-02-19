local wezterm = require("wezterm")
local keymaps = require("keymaps")

local config = wezterm.config_builder()
config.disable_default_key_bindings = true
config.automatically_reload_config = true
config.use_ime = false

config.font = wezterm.font("FiraCode Nerd Font")
config.harfbuzz_features = { "ss02", "cv02", "ss03", "ss05", "zero", "ss09", "ss06" }
config.webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1]

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keymaps.keys
config.key_tables = keymaps.key_tables
config.enable_wayland = false

return config
