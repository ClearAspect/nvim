return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline", -- source for math calculations
		"onsails/lspkind.nvim", -- for icons

		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
	},
	config = function()
		local luasnip = require("luasnip")
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()
		luasnip.filetype_extend("java", { "javadoc" })

		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					-- menu = ({
					-- 	buffer = "[Buffer]",
					-- 	nvim_lsp = "[LSP]",
					-- 	luasnip = "[LuaSnip]",
					-- 	nvim_lua = "[Lua]",
					-- 	latex_symbols = "[Latex]",
					-- })
				}),
			},
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<ESC>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
		})

		-- Set configuration for specific filetype.
		--  cmp.setup.filetype('gitcommit', {
		--    sources = cmp.config.sources({
		--      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		--    }, {
		--      { name = 'buffer' },
		--    })
		--  })

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
