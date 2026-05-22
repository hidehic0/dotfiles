hl.monitor({
	output = "DP-1",
	mode = "3840x2160@60",
	position = "auto",
	scale = 1.33,
})
hl.monitor({
	output = "eDP-1",
	mode = "highrr",
	position = "auto",
	scale = 1,
	mirror = "DP-1",
})

local browser = "vivaldi"
local menu = "rofi -combi-modi window,drun,ssh -show combi"
local terminal = "wezterm"
local file_manager = "pcmanfm"

local envs = {
	XDG_SESSION_TYPE = "wayland",
	XDG_SESSION_DESKTOP = "Hyprland",
	XDG_CURRENT_DESKTOP = "Hyprland",
	XDG_RUNTIME_DIR = "/run/user/1000",

	XCURSOR_SIZE = 24,
	XCURSOR_THEME = "Adwaita",

	ELECTRON_OZONE_PLATFORM_HINT = "auto",
	MOZ_ENABLE_WAYLAND = 1,
	WLR_NO_HARDWARE_CURSORS = 1,

	QT_IM_MODULE = "fcitx",
	GTK_IM_MODULE = "fcitx",
	XMODIFIERS = "@im=fcitx",
	SDL_IM_MODULE = "fcitx",
	INPUT_METHOD = "fcitx",

	GDK_SCALE = "1",
	QT_SCALE_FACTOR = "1",
	QT_QPA_PLATFORM = "wayland",
}

for name, value in pairs(envs) do
	hl.env(name, value)
end

local startup_commands = {
	"systemctl --user start xdg-desktop-portal-gtk.service fcitx5.service",
	"waybar",
	"swaync",
	"swayosd-server",
	"hypridle",
	"hyprpaper",
	"hyprsunset",
	"kdeconnect-indicator",

	"wl-paste --type text --watch cliphist store",
	"wl-paste --type image --watch cliphist store",
}

hl.on("hyprland.start", function()
	for _, cmd in ipairs(startup_commands) do
		hl.exec_cmd(cmd)
	end

	hl.dispatch(hl.dsp.focus({ workspace = 4 }))
	hl.exec_cmd("discord")
	hl.dispatch(hl.dsp.focus({ workspace = 2 }))
	hl.exec_cmd(terminal)
	hl.dispatch(hl.dsp.focus({ workspace = 1 }))
	hl.exec_cmd(browser)
end)

hl.config({
	general = {
		gaps_in = 1,
		gaps_out = 1,

		border_size = 2,

		col = {
			active_border = "rgba(5e81accc)",
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,

		allow_tearing = false,

		snap = {
			enabled = false,
		},
	},

	decoration = {
		rounding = 20,

		blur = {
			enabled = true,
			size = 3,
			passes = 3,
		},
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	input = {

		kb_layout = "jp",
		kb_variant = "",
		kb_model = "",
		kb_options = "ctrl:nocaps",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
		},
	},

	animations = {
		enabled = true,
	},

	xwayland = {
		enabled = true,
		force_zero_scaling = true,
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = "-0.5",
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "workspace",
})

local mainMod = "SUPER"

local function bind_with_main_mod(key, hook, other)
	hl.bind(mainMod .. " + " .. key, hook, other)
end

bind_with_main_mod("RETURN", hl.dsp.exec_cmd(terminal))
bind_with_main_mod("F2", hl.dsp.exec_cmd(browser))
bind_with_main_mod("F3", hl.dsp.exec_cmd(file_manager))
bind_with_main_mod("d", hl.dsp.exec_cmd(menu))

bind_with_main_mod("comma", hl.dsp.exec_cmd("hyprlock"))

bind_with_main_mod("v", hl.dsp.window.float({ action = "toggle" }))

bind_with_main_mod("SHIFT + q", hl.dsp.window.close())

bind_with_main_mod("h", hl.dsp.focus({ direction = "l" }))
bind_with_main_mod("l", hl.dsp.focus({ direction = "r" }))
bind_with_main_mod("k", hl.dsp.focus({ direction = "u" }))
bind_with_main_mod("j", hl.dsp.focus({ direction = "d" }))

bind_with_main_mod("SHIFT + h", hl.dsp.window.move({ direction = "l" }))
bind_with_main_mod("SHIFT + l", hl.dsp.window.move({ direction = "r" }))
bind_with_main_mod("SHIFT + k", hl.dsp.window.move({ direction = "u" }))
bind_with_main_mod("SHIFT + j", hl.dsp.window.move({ direction = "d" }))

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
end

bind_with_main_mod("mouse:272", hl.dsp.window.drag(), { mouse = true })
bind_with_main_mod("mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume=raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume=lower"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("swayosd-client --brightness raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("swayosd-client --brightness lower"),
	{ locked = true, repeating = true }
)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("swayosd-client --playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("swayosd-client --playerctl pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("swayosd-client --playerctl play"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("swayosd-client --playerctl prev"), { locked = true })

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	match = {
		class = "vivaldi-stable",
		title = "Bitwarden - Vivaldi",
		float = true,
	},
})

hl.window_rule({
	match = {
		class = "com.mitchellh.ghostty",
	},
	opacity = 0.7,
})
hl.window_rule({
	match = {
		class = "obsidian",
	},
	opacity = 0.7,
})
hl.window_rule({
	match = {
		class = "discord",
	},

	opacity = 0.9,
})
hl.window_rule({
	match = {
		class = "anki",
	},

	opacity = 0.8,
})
