return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	-- Setup language servers.
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr
		end

		-- LSP SERVERS

		if vim.fn.executable("biome") == 1 then
			lspconfig.biome.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end
		if vim.fn.executable("clangd") == 1 then
			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end
		if vim.fn.executable("jdtls") == 1 then
			lspconfig.jdtls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				handlers = {
					["language/status"] = function(_, result)
						-- Print or whatever.
					end,
					["$/progress"] = function(_, result, ctx)
						-- disable progress updates.
					end,
				},
			})
		end
		if vim.fn.executable("java-language-server") == 1 then
			lspconfig.java_language_server.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "java-language-server" },
			})
		end
		if vim.fn.executable("lua-language-server") == 1 then
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end

		if vim.fn.executable("ruff") == 1 then
			lspconfig.ruff.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end
		if vim.fn.executable("rust-analyzer") == 1 then
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end
		if vim.fn.executable("typescript-language-server") == 1 then
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end
		lspconfig.vimls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		if vim.fn.executable("zls") == 1 then
			lspconfig.zls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

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
	end,
}
