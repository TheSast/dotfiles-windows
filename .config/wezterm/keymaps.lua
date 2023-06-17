local wezterm = require("wezterm")
local act = wezterm.action

-- Event Handlers
wezterm.on("copy-or-send", function(window, pane)
	local has_selection = window:get_selection_text_for_pane(pane) ~= ""
	if has_selection then
		window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
		window:perform_action(act.ClearSelection, pane)
	else
		window:perform_action(act.SendKey({ key = "c", mods = "CTRL" }), pane)
	end
end)

-- wezterm.on('paste-or-send',function(window, pane)
--   local can_quote_insert = ???
--   if can_quote_insert then
--     window:perform_action(act.PasteFrom 'Clipboard')
--   else
--     window:perform_action(act.SendKey { key = 'v', mods = 'CTRL' }, pane)
--   end
-- end),

-- Keymaps
return {
	-- Standard keyboard behaviour in most terminals
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = act.ActivateCommandPalette,
	},
	{
		key = "F11",
		mods = "NONE",
		action = act.ToggleFullScreen,
	},
	{
		key = "-",
		mods = "CTRL",
		action = act.DecreaseFontSize,
	},
	{
		key = "+",
		mods = "CTRL",
		action = act.IncreaseFontSize,
	},
	{
		key = "c",
		mods = "CTRL",
		action = act.EmitEvent("copy-or-send"),
	},
	-- { -- temp arrangement, should only paste if the bind isn't taken by bash/fish/vim
	--   key = 'v',
	--   mods = 'CTRL',
	--   action = act.EmitEvent 'paste-or-send'
	-- },
}
