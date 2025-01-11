local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true
-- config.use_ime = false

config.font = wezterm.font("UDEV Gothic NF", {weight="Regular", stretch="Normal", style="Normal"})
config.font_size = 14.0

-- ウィンドウの透過
-- config.window_background_opacity = 0.85
-- config.macos_window_background_blur = 20

config.window_decorations = "RESIZE"

config.color_scheme = "nord"

config.initial_cols = 100
config.initial_rows = 40 

config.audible_bell = "Disabled"
config.window_close_confirmation = 'NeverPrompt'
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.enable_scroll_bar = false
config.front_end = "WebGpu"


config.window_frame = {
  font = wezterm.font { family ='Roboto', weight = 'Medium' },
  font_size = 14.0,
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

config.window_padding = {
   top = 10,
   bottom = 10,
}

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = wezterm.action.Nop,
  },
      -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    -- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
    {
        event = { Down = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.Nop,
    },
}

config.keys = {
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
