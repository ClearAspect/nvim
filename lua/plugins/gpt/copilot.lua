return {
	{
		"zbirenbaum/copilot.lua",
		event = { "VeryLazy" },
		lazy = true,
		config = function()
			local copilot = require("copilot")
			copilot.setup({
				panel = {
					enabled = false,
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>"
					},
					layout = {
						position = "right", -- | top | left | right
						ratio = 0.4
					},
				},
				suggestion = {
					enabled = false,
					auto_trigger = true,
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						accept = "<C-y>",
						accept_word = "<M-l>",
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = true,
					help = true,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = 'node', -- Node.js version must be > 18.x
				server_opts_overrides = {},

			})
		end,
	},

	{
		"copilotlsp-nvim/copilot-lsp",
		init = function()
			vim.g.copilot_nes_debounce = 500
			vim.lsp.enable("copilot")
			vim.keymap.set("n", "<Tab>", function()
				require("copilot-lsp.nes").apply_pending_nes()
			end)
		end,
	}
}
