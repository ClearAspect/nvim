return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	-- Setup language servers.
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end,
		})

		-- LSP SERVERS

		lspconfig.biome.setup({
			capabilities = capabilities,
		})
		lspconfig.clangd.setup({
			capabilities = capabilities,
		})
		lspconfig.jdtls.setup({
			capabilities = capabilities,
			handlers = {
				["language/status"] = function(_, result)
					-- Print or whatever.
				end,
				["$/progress"] = function(_, result, ctx)
					-- disable progress updates.
				end,
			},
		})
		-- lspconfig.java_language_server.setup({
		-- 	capabilities = capabilities,
		-- 	cmd = { "java-language-server" },
		-- })
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		lspconfig.ruff.setup({
			capabilities = capabilities,
		})
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
		})
		lspconfig.nil_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.vimls.setup({
			capabilities = capabilities,
		})
		lspconfig.zls.setup({
			capabilities = capabilities,
		})
	end,
}
