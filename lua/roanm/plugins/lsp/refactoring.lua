return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	event = { "VeryLazy" },
	lazy = true,
	config = function()
		require("refactoring").setup()
	end,
}
