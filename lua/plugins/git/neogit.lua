return {
	"NeogitOrg/neogit",
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		"ibhagwan/fzf-lua",
	},
	keys = {
		{ "<leader>Gs", "<cmd>Neogit<cr>", desc = "Git Status" },
	},
	config = true
}
