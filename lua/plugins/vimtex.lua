return {
	"lervag/vimtex",
	-- dependencies = { "" },
	lazy = false,
	-- event = { "VeryLazy" },
	ft = { "tex" },
	config = function()
		-- VimTeX configuration goes here, e.g.

		if vim.fn.has("macunix") then
			vim.g.vimtex_view_method = "skim"
		elseif vim.fn.has("unix") then
			vim.g.vimtex_view_method = "zathura"
		end
	end,
}
