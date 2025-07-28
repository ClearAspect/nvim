return {
	"supermaven-inc/supermaven-nvim",
	-- event = { "VeryLazy" },
	-- dependencies = { "" },
	-- lazy = false,
	-- ft = { "" },
	config = function()
		local supermaven = require("supermaven-nvim")
		supermaven.setup({})
	end,
}
