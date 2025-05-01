return {
	"ravitemer/mcphub.nvim",
	-- event = { "VeryLazy" },
	dependencies = { "nvim-lua/plenary.nvim" },
	-- lazy = false,
	-- ft = { "" },
	build = "npm install -g mcp-hub@latest",
	config = function()
		local mcp = require("mcphub")
		mcp.setup({
			-- options
			extensions = {
				avante = {
					make_slash_commands = true,
				}
			}
		})
	end,
}
