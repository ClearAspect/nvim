return {
	"neovim/nvim-lspconfig",
	event = { "VeryLazy" },
	dependencies = {
		-- "hrsh7th/cmp-nvim-lsp",
		"saghen/blink.cmp",
	},
	-- Setup language servers.
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- Diagnostic Lines
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
		})

		-- Inlay Hints
		vim.keymap.set("n", "<leader>i", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
		end, { desc = "Toggle inlay hints" })

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("my.lsp", {}),
			callback = function(args)
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
				local bufnr = args.buf

				-- Go to definition
				if client:supports_method("textDocument/definition") then
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						{ buffer = bufnr, desc = "LSP: Go to definition" }
					)
				end

				-- Go to declaration
				if client:supports_method("textDocument/declaration") then
					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						{ buffer = bufnr, desc = "LSP: Go to declaration" }
					)
				end

				-- Hover documentation
				if client:supports_method("textDocument/hover") then
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover documentation" })
				end

				-- Type definition (useful for TypeScript/strongly-typed languages)
				if client:supports_method("textDocument/typeDefinition") then
					vim.keymap.set(
						"n",
						"gy",
						vim.lsp.buf.type_definition,
						{ buffer = bufnr, desc = "LSP: Go to type definition" }
					)
				end

				-- Enable auto-completion
				-- if client:supports_method("textDocument/completion") then
				-- 	vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
				-- end

				-- Auto-format on save
				if
					not client:supports_method("textDocument/willSaveWaitUntil")
					and client:supports_method("textDocument/formatting")
				then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("my.lsp.format", { clear = false }),
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 1000 })
						end,
					})
				end
			end,
		})

		-- LSP SERVERS
		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				-- Your on_attach code here (keymaps, autocommands, etc.)
			end,

			root_markers = { ".git" },
		})

		vim.lsp.enable({
			"asm_lsp",
			"biome",
			"clangd",
			"copilot",
			"gopls",
			"jdtls",
			"lua_ls",
			"nixd",
			"pyright",
			"ruff",
			"rust_analyzer",
			"sqlls",
			-- "sourcekit",
			"tombi",
			"ts_ls",
			"vimls",
			"qmlls",
			"zls",
		})
	end,
}
