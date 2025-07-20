local wezterm = require("wezterm") --[[@as Wezterm]]
local act = wezterm.action

local config = wezterm.config_builder()

-- config.front_end = "WebGpu"
config.check_for_updates = true
config.automatically_reload_config = true
config.webgpu_power_preference = "HighPerformance"

config.enable_tab_bar = false
--config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
-- config.bold_brightens_ansi_colors = true

config.macos_window_background_blur = 15
config.window_background_opacity = 0.9

-- config.color_scheme_dirs = { "~/.config/wezterm/themes" }
-- config.color_scheme = "Tokyo Night Moon"
config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Tokyo Night Day"
-- config.font = wezterm.font("JetBrains Mono", { weight = "Regular" })
config.font = wezterm.font("GeistMono Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("Iosevka Nerd Font Mono", { weight = "Regular" })
-- config.font = wezterm.font("FiraMono Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("Hack Nerd Font Mono", { weight = "Regular" })
-- config.font = wezterm.font("0xProto Nerd Font Mono", { weight = "Regular" })
config.font_size = 16
config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}
config.keys = {
	{ key = "0", mods = "CTRL", action = act.PaneSelect },
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
}

return config
