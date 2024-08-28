return {

	{ "morhetz/gruvbox" },
	{
		"sonph/onehalf",
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/vim")
		end,
	},
	{
		"dgox16/oldworld.nvim",
		config = function()
			local oldworld = require("oldworld")
			oldworld.setup({
				terminal_colors = true, -- enable terminal colors
				styles = { -- You can pass the style using the format: style = true
					comments = { italic = true }, -- style for comments
					keywords = { italic = true }, -- style for keywords
					identifiers = {}, -- style for identifiers
					functions = { italic = true }, -- style for functions
					variables = {}, -- style for variables
					booleans = {}, -- style for booleans
				},
				integrations = { -- You can disable/enable integrations
					alpha = true,
					cmp = true,
					flash = true,
					gitsigns = true,
					hop = false,
					indent_blankline = true,
					lazy = true,
					lsp = true,
					markdown = true,
					mason = true,
					navic = false,
					neo_tree = false,
					neorg = false,
					noice = true,
					notify = true,
					rainbow_delimiters = false,
					telescope = true,
					treesitter = true,
				},
				highlight_overrides = {},
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
