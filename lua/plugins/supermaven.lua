return {
	"supermaven-inc/supermaven-nvim",
	-- dependencies = { "" },
	-- lazy = false,
	-- event = { "VeryLazy" },
	-- ft = { "" },
	config = function()
		-- local plugin_name = require("plugin-name")
		-- plugin_name.setup({
		-- 	-- options
		-- })

		local supermaven = require("supermaven-nvim")

		supermaven.setup({
			keymaps = {
				accept_suggestion = "<C-]>",
				clear_suggestion = "<Tab>",
				accept_word = "<C-j>",
			},
			ignore_filetypes = { cpp = true }, -- or { "cpp", }
			-- color = {
			-- 	suggestion_color = "#ffffff",
			-- 	cterm = 244,
			-- },
			log_level = "info",       -- set to "off" to disable logging completely
			disable_inline_completion = false, -- disables inline completion for use with cmp
			disable_keymaps = false,  -- disables built in keymaps for more manual control
			condition = function()
				return false
			end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
		})
	end,
}
