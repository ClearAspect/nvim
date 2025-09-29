return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	event = "VeryLazy",
	lazy = true,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		-- "fang2hou/blink-copilot",
	},
	keys = {
		{ "<C-E>", function() require("luasnip").expand() end, mode = "i", desc = "Expand snippet" },
		{ "<C-N>", function() require("luasnip").jump(1) end, mode = { "i", "s" }, desc = "Jump to next snippet node" },
		{ "<C-P>", function() require("luasnip").jump(-1) end, mode = { "i", "s" }, desc = "Jump to previous snippet node" },
		{ "<C-CR>", function() if require("luasnip").choice_active() then require("luasnip").change_choice(1) end end, mode = { "i", "s" }, desc = "Change choice in snippet" },
	},

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

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

		completion = {
			-- 'prefix' will fuzzy match on the text before the cursor
			-- 'full' will fuzzy match on the text before *and* after the cursor
			-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
			keyword = { range = "full" },

			-- Disable auto brackets
			-- NOTE: some LSPs may add auto brackets themselves anyway
			accept = { auto_brackets = { enabled = false } },

			-- Insert completion item on selection, don't select by default
			list = { selection = { preselect = true, auto_insert = true } },
			-- or set per mode
			-- list = { selection = function(ctx) return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect' end },

			menu = {
				-- Don't automatically show the completion menu
				auto_show = true,

				-- nvim-cmp style menu
				draw = {
					columns = {
						{ "label",     "label_description", gap = 1 },
						{ "kind_icon", gap = 1,             "kind" },
					},
				},

				-- border = 'rounded',
			},

			-- Show documentation when selecting a completion item
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = { border = "rounded" },
			},

			-- Display a preview of the selected item on the current line
			ghost_text = { enabled = true },
		},

		sources = {
			-- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
			default = { "lsp", "path", "snippets", "buffer" },

			-- providers = {
			-- 	copilot = {
			-- 		name = "copilot",
			-- 		module = "blink-copilot",
			-- 		score_offset = 100,
			-- 		async = true,
			-- 	},
			-- },
			-- Disable cmdline completions
			-- cmdline = {},
		},

		-- Experimental signature help support
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",

			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰫧",
				Property = "󰖷",

				Class = "󰯳",
				Interface = "󰰅",
				Struct = "󰰣",
				Module = "󰆼",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰯹",
				EnumMember = "",

				Keyword = "",
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

		snippets = {
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					return require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},

		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
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
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.default" },
}
