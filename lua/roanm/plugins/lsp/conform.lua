return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "ruff_format" },
				-- Use a sub-list to run only the first available formatter
				-- javascript = { "biome" },
				-- typescript = { "biome" },
				-- javascriptreact = { "biome" },
				-- typescriptreact = { "biome" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				java = { "clang-format" },
				css = { "prettier" },
				nix = { "alejandra" },
				zig = { "zig fmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
