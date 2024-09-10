return {
	{
		"zbirenbaum/copilot.lua",
		event = "BufReadPre",
		lazy = true,
		config = function()
			local copilot = require("copilot")
			copilot.setup({})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim", -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
