return {
	"stevearc/conform.nvim",
	event = { "VeryLazy" },
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
				json = { "biome" },
				jsonc = { "biome" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				java = { "clang-format" },
				css = { "prettier" },
				nix = { "alejandra" },
				zig = { "zig fmt" },
				toml = { "taplo" },
				sql = { "sqlfmt" },
				s = { "asmfmt" },
				asm = { "asmfmt" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 10000,
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 10000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
