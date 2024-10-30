return {
	{
		"catppuccin/nvim",
		priority = 1000,
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

		config = function()
			local nord = require("nord")
		end,

	},
}
