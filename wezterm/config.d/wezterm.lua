local wezterm = require 'wezterm'
local config = {}

config.scrollback_lines = 9999999

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Font
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16.0

-- https://wezfurlong.org/wezterm/colorschemes/g/index.html
config.color_scheme = 'Guezwhoz'
config.default_cursor_style = 'SteadyUnderline'
config.colors = {
  cursor_bg = 'cyan',
  cursor_fg = 'black',
}

-- skip confirmation prompt when quitting app
config.window_close_confirmation = 'NeverPrompt'

return config