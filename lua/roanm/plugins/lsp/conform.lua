return {
	"stevearc/conform.nvim",
	event = { "VeryLazy" },
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			-- Conform will run multiple formatters sequentially
			-- Use a sub-list to run only the first available formatter
			formatters_by_ft = {
				asm = { "asmfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				css = { "prettier" },
				go = { "gofmt" },
				java = { "clang-format" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				json = { "biome" },
				jsonc = { "biome" },
				lua = { "stylua" },
				nix = { "alejandra" },
				python = { "ruff_format" },
				rust = { "rustfmt" },
				s = { "asmfmt" },
				sql = { "sqlfmt" },
				toml = { "taplo" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				zig = { "zig fmt" },
				-- javascript = { "biome" },
				-- typescript = { "biome" },
				-- javascriptreact = { "biome" },
				-- typescriptreact = { "biome" },
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
