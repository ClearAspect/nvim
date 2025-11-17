return {
	"ibhagwan/fzf-lua",
	event = { "VeryLazy" },
	lazy = true,
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Fuzzy Live Grep",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Fuzzy Buffers",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "Fuzzy MRU Files",
		},
		{
			"<leader>fl",
			function()
				require("fzf-lua").blines()
			end,
			desc = "Fuzzy Buffer",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "Fuzzy Document Symbols",
		},
		{
			"<leader>fe",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "Fuzzy Errors",
		},
		-- TODO FIXME INFO HACK PERF NOTE FIX
		{
			"<leader>fc",
			function()
				require("fzf-lua").grep({ search = "TODO|FIXME|INFO|HACK|PERF|NOTE|FIX", no_esc = true })
			end,
			desc = "Fuzzy Comments",
		},
	},
	-- :lua require('fzf-lua').grep({search='TODO|HACK|PERF|NOTE|FIX', no_esc=true})
	config = function()
		-- calling `setup` is optional for customization
		local fzf_lua = require("fzf-lua")
		fzf_lua.setup({})
	end,
}
