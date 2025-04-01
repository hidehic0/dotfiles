local wezterm = require("wezterm")
local keymaps = require("keymaps")

local config = wezterm.config_builder()
config.disable_default_key_bindings = true
config.automatically_reload_config = true
config.use_ime = false

config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font',          -- メインのプログラミングフォント
  'Noto Sans CJK JP',            -- 追加のフォールバック（必要に応じて）
}
config.harfbuzz_features = { "ss02", "cv02", "ss03", "ss05", "zero", "ss09", "ss06" }
config.webgpu_preferred_adapter = wezterm.gui.enumerate_gpus()[1]

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keymaps.keys
config.key_tables = keymaps.key_tables
config.enable_wayland = false

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local title = wezterm.truncate_right(utils.basename(tab.active_pane.foreground_process_name), max_width)
  if title == "" then
    title =
      wezterm.truncate_right(utils.basename(utils.convert_home_dir(tab.active_pane.current_working_dir)), max_width)
  end
  return {
    { Text = tab.tab_index + 1 .. ":" .. title },
  }
end)

return config
