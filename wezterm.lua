local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.font = wezterm.font("PlemolJP Console NF", {weight="Medium", stretch="Normal", style="Normal"})
config.font_size = 14.0
-- config.color_scheme = 'Navy and Ivory (terminal.sexy)'
config.color_scheme = "nord"


config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.3cell',
  bottom = '0.3cell',
}


config.window_frame = {
  font = wezterm.font { family ='Roboto', weight = 'Medium' },
  font_size = 14.0,
}

return config
