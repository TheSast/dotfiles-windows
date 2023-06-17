local wezterm = require("wezterm")

wezterm.on("cycle-opacity", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.window_background_opacity == nil then
		overrides.window_background_opacity = 0.6
	else
		if overrides.window_background_opacity == 0.6 then
			overrides.window_background_opacity = 0.9
		else
			overrides.window_background_opacity = nil
		end
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("toggle-padding", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.window_padding == nil then
		overrides.window_padding = {
			left = "0cell",
			right = "0cell",
			top = "0cell",
			bottom = "0cell",
		}
	else
		overrides.window_padding = nil
	end
	window:set_config_overrides(overrides)
end)
