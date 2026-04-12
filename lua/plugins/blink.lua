return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	event = "VeryLazy",
	lazy = true,
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			config = function()
				require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnippets" })
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		-- "fang2hou/blink-copilot",
		-- "zbirenbaum/copilot.lua",
	},
	keys = {
		{
			"<C-E>",
			function()
				require("luasnip").expand()
			end,
			mode = "i",
			desc = "Expand snippet",
		},
		{
			"<C-N>",
			function()
				require("luasnip").jump(1)
			end,
			mode = { "i", "s" },
			desc = "Jump to next snippet node",
		},
		{
			"<C-P>",
			function()
				require("luasnip").jump(-1)
			end,
			mode = { "i", "s" },
			desc = "Jump to previous snippet node",
		},
		{
			"<C-CR>",
			function()
				if require("luasnip").choice_active() then
					require("luasnip").change_choice(1)
				end
			end,
			mode = { "i", "s" },
			desc = "Change choice in snippet",
		},
	},

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = "nix run .#build-plugin",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- Disable for some filetypes
		enabled = function()
			return not vim.tbl_contains({ "test", "test" }, vim.bo.filetype)
				and vim.bo.buftype ~= "prompt"
				and vim.b.completion ~= false
		end,

		fuzzy = { implementation = "rust" },

		keymap = {
			preset = "default",
			["<M-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<C-y>"] = { "accept", "fallback" },

			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			-- ["<Tab>"] = {
			-- 	function(cmp)
			-- 		if vim.b[vim.api.nvim_get_current_buf()].nes_state then
			-- 			cmp.hide()
			-- 			return (
			-- 				require("copilot-lsp.nes").apply_pending_nes()
			-- 				and require("copilot-lsp.nes").walk_cursor_end_edit()
			-- 			)
			-- 		end
			-- 		if cmp.snippet_active() then
			-- 			return cmp.accept()
			-- 		else
			-- 			return cmp.select_and_accept()
			-- 		end
			-- 	end,
			-- 	"snippet_forward",
			-- 	"fallback",
			-- },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},
		appearance = {
			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		sources = {
			-- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
			-- default = { "lsp", "path", "snippets", "buffer", copilot },
			default = { "lsp", "path", "snippets", "buffer" },

			providers = {
				-- copilot = {
				-- 	name = "copilot",
				-- 	module = "blink-copilot",
				-- 	score_offset = 100,
				-- 	async = true,
				-- },
				snippets = {
					-- score_offset = 10,
					should_show_items = true,
				},
			},

			-- Disable cmdline completions
			-- cmdline = {},
		},

		-- Experimental signature help support
		signature = {
			enabled = true,
			trigger = {
				-- Show the signature help automatically
				enabled = true,
			},
		},

		snippets = { preset = "luasnip" },

		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.default" },
}
