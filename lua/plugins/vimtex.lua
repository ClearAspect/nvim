return {
	"lervag/vimtex",
	-- dependencies = { "" },
	lazy = false,
	-- event = { "VeryLazy" },
	ft = { "tex" },
	config = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "general"
	end,
}
