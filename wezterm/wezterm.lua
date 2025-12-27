local wezterm = require("wezterm")
local keymaps = require("keymaps")

local config = wezterm.config_builder()
config.disable_default_key_bindings = true
config.automatically_reload_config = true
config.use_ime = false

config.font = wezterm.font_with_fallback({
  "FiraCode Nerd Font",
  "Noto Sans CJK JP",
})
config.harfbuzz_features = { "ss02", "cv02", "ss03", "ss05", "zero", "ss09", "ss06" }

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keymaps.keys
config.key_tables = keymaps.key_tables
config.enable_wayland = true

config.window_background_opacity = 0.5

config.tab_bar_at_bottom = true
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false
config.colors = {
  tab_bar = {
    background = "none",
  },
  cursor_bg = "white",
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_pixelated_squares_big_mirrored
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_pixelated_squares_big

---@diagnostic disable-next-line: unused-local
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#585b70"
  local foreground = "#1e1e2e"

  if tab.is_active then
    background = "#8aadf4"
    foreground = "#1e1e2e"
  end

  local title = "   " .. tab.tab_index .. ":" .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

  return {
    { Foreground = { Color = background } },
    { Background = { Color = "none" } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Foreground = { Color = background } },
    { Background = { Color = "none" } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)
config.use_fancy_tab_bar = false

return config
