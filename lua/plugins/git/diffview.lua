return {
	"sindrets/diffview.nvim",
	lazy = true,
	event = "VeryLazy",
	cmd = {
		"DiffviewOpen",
		"DiffviewFileHistory",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
		"DiffviewLog",
	},
	keys = {
		{ "<leader>Gdo", "<cmd>DiffviewOpen<cr>", desc = "Open Diff View" },
		{ "<leader>Gdc", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
	},

	config = function()
		local diffview = require("diffview")
		local actions = require("diffview.actions")

		diffview.setup({
			diff_binaries = false, -- Show diffs for binaries
			enhanced_diff_hl = true, -- See |diffview-config-enhanced_diff_hl|
			git_cmd = { "git" }, -- The git executable followed by default args.
			hg_cmd = { "hg" }, -- The hg executable followed by default args.
			use_icons = true, -- Requires nvim-web-devicons
			show_help_hints = true, -- Show hints for how to open the help panel
			watch_index = true, -- Update views and index buffers when the git index changes.

			-- hooks = {
			-- 	diff_buf_win_enter = function(bufnr, winid, ctx)
			-- 		if ctx.layout_name:match("^diff2") then
			-- 			if ctx.symbol == "a" then
			-- 				vim.opt_local.winhl = table.concat({
			-- 					"DiffAdd:DiffviewDiffAddAsDelete",
			-- 					"DiffDelete:DiffviewDiffDelete",
			-- 				}, ",")
			-- 			elseif ctx.symbol == "b" then
			-- 				vim.opt_local.winhl = table.concat({
			-- 					"DiffDelete:DiffviewDiffDelete",
			-- 				}, ",")
			-- 			end
			-- 		end
			-- 	end,
			-- }
		})
	end,
}
