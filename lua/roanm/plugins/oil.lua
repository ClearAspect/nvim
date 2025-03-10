return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("oil").setup({

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
