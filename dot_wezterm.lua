local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function color_scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Ef-Autumn'
  else
    return 'Ef-Light'
  end
end

config.color_scheme = color_scheme_for_appearance(get_appearance())
config.font_size = 15

config.initial_cols = 120
config.initial_rows = 30

config.window_decorations = 'RESIZE'

config.keys = {
  { key = 'k', mods = 'CMD', action = act.ClearScrollback 'ScrollbackAndViewport' },
}

return config
