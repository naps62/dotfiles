local wezterm = require("wezterm")
local config = wezterm.config_builder()

local act = wezterm.action

config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.pane_focus_follows_mouse = true

-- font
local font = wezterm.font("FiraCode Nerd Font")
config.font = font
config.font_size = 16

-- theme
config.color_scheme = "Catppuccin Mocha"
config.inactive_pane_hsb = {
	saturation = 0.7,
	brightness = 0.7,
}

config.front_end = "OpenGL"
config.webgpu_preferred_adapter = {
	backend = "Gl",
	device = 0,
	device_type = "Other",
	driver_info = "560.31.02",
	name = "zink Vulkan 1.3(NVIDIA GeForce RTX 4060 (NVIDIA_PROPRIETARY))",
	vendor = 65541,
}

-- keys
config.keys = {
	-- tabs
	{ key = "t", mods = "ALT", action = act.SpawnCommandInNewTab({ args = { "zsh" } }) },
	{ key = "u", mods = "ALT", action = act.ActivateTabRelative(-1) },
	{ key = "i", mods = "ALT", action = act.ActivateTabRelative(1) },

	-- panes
	{ key = "Enter", mods = "ALT", action = act.SplitHorizontal },
	{ key = "s", mods = "ALT", action = act.SplitHorizontal },
	{ key = "d", mods = "ALT", action = act.SplitVertical },
	{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },

	--  resize panes
	{ key = "H", mods = "ALT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "J", mods = "ALT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "K", mods = "ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "L", mods = "ALT", action = act.AdjustPaneSize({ "Right", 5 }) },

	-- CTRL-SHIFT-l activates the debug overlay
	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
}

return config
