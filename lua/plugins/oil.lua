return {
	"stevearc/oil.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>fv", "<cmd>Oil<cr>", desc = "Open Oil" },
	},
	config = function()
		require("oil").setup({

			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},

			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = false,
			view_options = {
				show_hidden = true,
				natural_order = true,
			},
			win_options = {
				wrap = true,
			},
		})
	end,
}
