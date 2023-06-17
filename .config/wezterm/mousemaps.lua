local wezterm = require 'wezterm'
local act = wezterm.action
return {
  -- Standard mouse behaviour in most terminals
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.SelectTextAtMouseCursor 'Cell',
  },
  {
    event = { Down = { streak = 2, button = 'Left' } },
    mods = 'NONE',
    action = act.SelectTextAtMouseCursor 'Word',
  },
  {
    event = { Down = { streak = 3, button = 'Left' } },
    mods = 'NONE',
    action = act.SelectTextAtMouseCursor 'Line',
  },
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'META',
    action = act.ExtendSelectionToMouseCursor 'Block',
  },
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'SHIFT',
    action = act.ExtendSelectionToMouseCursor 'Cell',
  },
  {
    event = { Drag = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.ExtendSelectionToMouseCursor 'Cell',
  },
  {
    event = { Drag = { streak = 2, button = 'Left' } },
    mods = 'NONE',
    action = act.ExtendSelectionToMouseCursor 'Word',
  },
  {
    event = { Drag = { streak = 3, button = 'Left' } },
    mods = 'NONE',
    action = act.ExtendSelectionToMouseCursor 'Line',
  },
  {
    event = { Drag = { streak = 1, button = 'Left' } },
    mods = 'META',
    action = act.ExtendSelectionToMouseCursor 'Block',
  },
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = act.PasteFrom 'Clipboard',
  },
}
