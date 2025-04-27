return {



	"neovim/nvim-lspconfig",
	event = { "VeryLazy" },
	dependencies = {
		-- "hrsh7th/cmp-nvim-lsp",
		'saghen/blink.cmp'
	},
	-- Setup language servers.
	config = function()
		local capabilities = require('blink.cmp').get_lsp_capabilities()


		-- Diagnostic Lines
		vim.diagnostic.config({
			virtual_lines = {
				current_line = true,
			},
		})

		-- Inlay Hints
		vim.keymap.set("n", '<leader>i',
			function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 }) end,
			{ desc = "Toggle inlay hints" })

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)


		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('my.lsp', {}),
			callback = function(args)
				-- Enable completion triggered by <c-x><c-o>
				-- vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = args.buf }

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

				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

				if client:supports_method('textDocument/implementation') then
					-- Create a keymap for vim.lsp.buf.implementation ...
				end

				-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
				if client:supports_method('textDocument/completion') then
					-- Optional: trigger autocompletion on EVERY keypress. May be slow!
					-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
					-- client.server_capabilities.completionProvider.triggerCharacters = chars
					-- vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
				end

				-- Auto-format ("lint") on save.
				-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
				if not client:supports_method('textDocument/willSaveWaitUntil')
					and client:supports_method('textDocument/formatting') then
					vim.api.nvim_create_autocmd('BufWritePre', {
						group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
						end,
					})
				end
			end,
		})


		-- LSP SERVERS
		vim.lsp.config(
			'*',
			{
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Your on_attach code here (keymaps, autocommands, etc.)
				end,

				root_markers = { '.git' },
			})

		vim.lsp.enable({
			"asm_lsp",
			"biome",
			"clangd",
			"gopls",
			"jdtls",
			"lua_ls",
			"nixd",
			"ruff",
			"rust_analyzer",
			"sqlls",
			"ts_ls",
			"vimls",
			"zls",
		})
	end,
}
