return {
	{
		"zbirenbaum/copilot.lua",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		config = function()
			local copilot = require("copilot")
			copilot.setup({
				panel = {
					enabled = true,
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
					enabled = true,
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
					markdown = false,
					help = false,
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
		"CopilotC-Nvim/CopilotChat.nvim",
		event = { "BufReadPre", "BufNewFile" },
		branch = "canary",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim", -- for curl, log wrapper
		},
		opts = {
			debug = false,      -- Enable debugging
			-- See Configuration section for rest
			model = 'claude-3.5-sonnet', -- GPT model to use, see ':CopilotChatModels' for available models
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
