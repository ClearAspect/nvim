return {
	{
		dir = "~/Developer/umbra/",
		lazy = false,
		priority = 1000,
		config = function()
			local onehalf = require("umbra")
			onehalf.setup({
				transparency = false,
				terminal_colors = true, -- Apply the theme to neovim terminal windows
				dimming = {
					enable = false,
					dim_level = 0.33,
					preserve_accents = true,
				},
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				styles = {
					comments = { italic = true },
					conditionals = {},
					loops = {},
					functions = {},
					keywords = { italic = true },
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
			})
		end,
	},
	-- My Version of OneHalf
	{
		-- "clearaspect/onehalf",
		dir = "~/Developer/onehalf/",
		lazy = false,
		priority = 1000,
		config = function()
			local onehalf = require("onehalf")
			onehalf.setup({
				transparency = false,
				terminal_colors = true, -- Apply the theme to neovim terminal windows
				dimming = {
					enable = false,
					dim_level = 0.33,
					preserve_accents = true,
				},
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				styles = {
					comments = { italic = true },
					conditionals = {},
					loops = {},
					functions = {},
					keywords = { italic = true },
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
			})
		end,
	},
	-- {
	-- 	"bachiitter/orng.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("orng").setup()
	-- 	end,
	-- },
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	config = function()
	-- 		local catppuccin = require("catppuccin")
	-- 		catppuccin.setup({
	-- 			flavour = "auto",
	-- 			transparent_background = false,
	-- 			term_colors = true,
	-- 			styles = {
	-- 				comments = { "italic" },
	-- 				types = { "italic" },
	-- 				conidtionals = { "italic" },
	-- 				functions = { "italic" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"myxik/lovelace.nvim",
		lazy = false,
		priority = 1000,
	},
	-- {
	-- 	"shaunsingh/nord.nvim",
	-- },
}
