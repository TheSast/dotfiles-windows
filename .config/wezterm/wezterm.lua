local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Appereance
wezterm.on("gui-startup", function()
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():set_config_overrides({
		window_padding = { left = "0cell", right = "0cell", top = "0cell", bottom = "0cell" },
		window_background_opacity = 0.6,
	})
end)
config.max_fps = 120
config.window_background_opacity = 0.3
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#0c0c0c",
			fg_color = "#ffffff",
		},
	},
}

--- Font
local fontpool = { "FiraCode NF", "JetBrainsMono NF" }
math.randomseed(os.time())
config.font = wezterm.font(fontpool[math.random(#fontpool)])

-- Enviroment
config.wsl_domains = {
	{
		name = "WSL:Ubuntu",
		distribution = "Ubuntu",
		default_cwd = "~",
	},
}
config.default_domain = "WSL:Ubuntu"

-- Other
config.window_close_confirmation = "NeverPrompt"

-- Bindings
config.disable_default_key_bindings = true
config.leader = { key = "Space", mods = "CTRL|ALT" }
config.keys = require("keymaps")
config.disable_default_mouse_bindings = true
config.bypass_mouse_reporting_modifiers = "LEADER"
config.mouse_bindings = require("mousemaps")

-- Events
require("events")

return config
