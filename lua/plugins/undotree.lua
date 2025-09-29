return {
	"mbbill/undotree",
	cmd = "UndotreeToggle",
	event = "BufRead",
	lazy = true,
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Open UndoTree" },
	},
	config = function() end,
}
