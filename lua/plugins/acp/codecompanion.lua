return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	-- lazy = false,
	-- event = { "VeryLazy" },
	-- ft = { "" },
	opts = {
		strategies = {
			-- Change the default chat adapter and model
			chat = {
				adapter = "copilot",
				model = "claude-3.5-sonnet",
			},
		},              -- NOTE: The log_level is in `opts.opts`
		opts = {
			log_level = "DEBUG", -- or "TRACE"
		},
	},
}
