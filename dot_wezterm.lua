local wezterm = require "wezterm"
local config = wezterm.config_builder()
local act = wezterm.action

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Dark"
end

local function color_scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Tokyo Night Storm"
  else
    return "Tokyo Night Day"
  end
end

config.color_scheme = color_scheme_for_appearance(get_appearance())
config.font_size = 16

config.initial_cols = 120
config.initial_rows = 30

config.window_decorations = "RESIZE"

config.keys = {
  { key = "k", mods = "CMD", action = act.ClearScrollback "ScrollbackAndViewport" },
}

return config
