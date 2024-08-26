return {
	"OXY2DEV/markview.nvim",

	dependencies = {
		-- You may not need this if you don't lazy load
		-- Or if the parsers are in your $RUNTIMEPATH
		"nvim-treesitter/nvim-treesitter",

		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local markview = require("markview")
		local presets = require("markview.presets")

		markview.setup({
			headings = presets.headings.glow_labels,
		})
		vim.cmd("Markview enableAll")
	end,
}
