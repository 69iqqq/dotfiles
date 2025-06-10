-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
-- -- This is where you actually apply your config choices
-- Define the toggle-tab-bar event
wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		-- Set to 0.8 for semi-transparency
		overrides.window_background_opacity = 0.90
	else
		-- Reset to fully opaque
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		key = "t",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
}
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	},

	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("MonacoLigaturized", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	},
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("CaskaydiaMono Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
	},
	-- {
	--   intensity = 'Bold',
	--   italic = true,
	--   font = wezterm.font("ComicCodeLigatures Nerd Font", {weight="Bold", stretch="Normal", style="Italic"})
	-- },
}
-- my coolnight colorscheme
--
-- config.color_scheme = "Solarized Dark Higher Contrast"
-- config.color_scheme = "rose-pine-moon"
-- config.color_scheme = "Solarized Dark - Patched"
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Cloud (terminal.sexy)"
-- config.color_scheme = "Zenburn"
-- config.color_scheme = "Mono White (Gogh)"
--config.color_scheme = "Everforest Dark (Gogh)"
-- config.color_scheme = "Eldritch"
config.colors = {
	-- 	foreground = "#CBE0F0",
	-- background = "000000"
	--	 background = "#171928",
	-- background = "#011423",
	-- background = "#011219",
	-- 	cursor_bg = "#47FF9C",
	-- 	cursor_border = "#47FF9C",
	-- 	cursor_fg = "#011423",
	-- 	selection_bg = "#033259",
	-- 	selection_fg = "#CBE0F0",
	-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- config.font = wezterm.font("BlexMono Nerd Font")
 config.font = wezterm.font("JetBrainsMono Nerd Font")
--config.font = wezterm.font("MonacoLigaturized")

--config.font = wezterm.font("CaskaydiaMono Nerd Font")
--config.font = wezterm.font("IosevkaTerm Nerd Font")
config.font_size = 17

config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 8,
	bottom = 0,
}
config.animation_fps = 120
config.max_fps = 120

config.window_decorations = "RESIZE"
--config.window_background_opacity = 0.8
--config.win32_system_backdrop = "Acrylic"
config.default_domain = "WSL:Ubuntu-24.04"
-- and finally, return the configuration to wezterm
-- config.default_prog = {
-- 	"wsl.exe",
-- 	"--distribution",
-- 	"Ubuntu-24.04",
-- 	"--exec",
-- 	"bash",
-- 	"-c",
-- 	"cd ~ && exec /usr/bin/fish -l",
-- }
-- KEY BINDS
return config
