local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font("PlemolJP Console NF", {weight="Medium", stretch="Normal", style="Normal"})
config.font_size = 14.0

config.color_scheme = "nord"

config.initial_cols = 100
config.initial_rows = 40 

config.audible_bell = "Disabled"
config.window_close_confirmation = 'NeverPrompt'
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.enable_scroll_bar = false
config.front_end = "WebGpu"
config.window_decorations = "RESIZE"

config.use_ime = false

config.window_frame = {
  font = wezterm.font { family ='Roboto', weight = 'Medium' },
  font_size = 14.0,
}

config.window_padding = {
  left = 5,
  right = 0,
  top = 0,
  bottom = 0,
}

config.keys = {
  {
    key = 'f',
    mods = 'CMD',
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = ';',
    mods = 'CMD',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = '-',
    mods = 'CMD',
    action = wezterm.action.DecreaseFontSize,
  },
}

return config
