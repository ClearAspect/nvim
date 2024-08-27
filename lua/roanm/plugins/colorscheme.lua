return {

	{
		"morhetz/gruvbox",
	},
	{
		"rmehri01/onenord.nvim",
		config = function()
			local onenord = require("onenord")
			onenord.setup({
				theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
				borders = true, -- Split window borders
				fade_nc = false, -- Fade non-current windows, making them more distinguishable
				-- Style that is applied to various groups: see `highlight-args` for options
				styles = {
					comments = "NONE",
					strings = "NONE",
					keywords = "NONE",
					functions = "NONE",
					variables = "NONE",
					diagnostics = "underline",
				},
				disable = {
					background = false, -- Disable setting the background color
					float_background = false, -- Disable setting the background color for floating windows
					cursorline = false, -- Disable the cursorline
					eob_lines = true, -- Hide the end-of-buffer lines
				},
				-- Inverse highlight for different groups
				inverse = {
					match_paren = false,
				},
				custom_highlights = {}, -- Overwrite default highlight groups
				custom_colors = {}, -- Overwrite default colors
			})
		end,
	},
	{
		"olimorris/onedarkpro.nvim",
		config = function()
			local onedarkpro = require("onedarkpro")
			onedarkpro.setup({
				styles = {
					types = "NONE",
					methods = "NONE",
					numbers = "NONE",
					strings = "NONE",
					comments = "italic",
					keywords = "bold,italic",
					constants = "NONE",
					functions = "italic",
					operators = "NONE",
					variables = "NONE",
					parameters = "NONE",
					conditionals = "italic",
					virtual_text = "NONE",
				},
				options = {
					cursorline = false, -- Use cursorline highlighting?
					transparency = true, -- Use a transparent background?
					terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
					lualine_transparency = false, -- Center bar transparency?
					highlight_inactive_windows = false, -- When the window is out of focus, change the normal background?
				},
			})
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			local monokai = require("monokai-pro")
			monokai.setup({
				transparent_background = false,
				terminal_colors = true,
				devicons = true, -- highlight the icons of `nvim-web-devicons`
				styles = {
					comment = { italic = true },
					keyword = { italic = true }, -- any other keyword
					type = { italic = true }, -- (preferred) int, long, char, etc
					storageclass = { italic = true }, -- static, register, volatile, etc
					structure = { italic = true }, -- struct, union, enum, etc
					parameter = { italic = true }, -- parameter pass in function
					annotation = { italic = true },
					tag_attribute = { italic = true }, -- attribute of tag in reactjs
				},
				filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
				-- Enable this will disable filter option
				day_night = {
					enable = false, -- turn off by default
					day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
					night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
				},
			})
		end,
	},
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			local catppuccin = require("catppuccin")
			catppuccin.setup({
				flavour = "auto",
				transparent_background = true,
				term_colors = true,
				styles = {
					comments = { "italic" },
					types = { "italic" },
					conidtionals = { "italic" },
					functions = { "italic" },
				},
			})
		end,
	},
}
