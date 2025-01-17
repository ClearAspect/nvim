return {
	-- My Version of OneHalf
	{
		-- 'clearaspect/onehalf',
		dir = '~/Documents/GitHub/OneHalf/onehalf/',
		lazy = false,
		priority = 1000,
	},
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
}
