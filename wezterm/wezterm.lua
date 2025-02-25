-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font =
    wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false })
config.font_size = 12.5

-- config.window_background_opacity    = 0.85
-- config.macos_window_background_blur = 35
-- config.window_background_image  =  "/Users/anhtuannguyen/.config/background/zenitsu.webp"
config.keys = {
  {
    key = 'r',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ReloadConfiguration,
  },
}
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

-- and finally, return the configuration to wezterm
return config
