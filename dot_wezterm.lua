local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Ayu Dark (Gogh)'
config.font_size = 15

config.initial_cols = 120
config.initial_rows = 30

config.window_decorations = "RESIZE"

return config
