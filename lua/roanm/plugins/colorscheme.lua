return {
	{
		"catppuccin/nvim",
		config = function()
			local catppuccin = require("catppuccin")
			catppuccin.setup({
				flavour = "auto",
				transparent_background = false,
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
	{
		"shaunsingh/nord.nvim",

	},
	{
		'navarasu/onedark.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			local onedark = require('onedark')
			onedark.setup {
				style = 'darker'
			}
			require('onedark').load()
		end
	},
	{
		'sonph/onehalf',
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/vim")
		end
	},
	{
		-- 'clearaspect/onehalfdark',
		dir = '~/Documents/GitHub/OneHalf/onehalftest/',
		lazy = false,
		priority = 1000,
	},
	{
		'olivercederborg/poimandres.nvim',
		config = function()
			require('poimandres').setup {
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			}
		end,
	},
}
