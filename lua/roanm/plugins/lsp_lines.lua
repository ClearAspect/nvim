return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local lsp_lines = require("lsp_lines")

		lsp_lines.setup()
	end,
}
