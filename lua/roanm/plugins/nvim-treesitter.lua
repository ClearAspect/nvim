return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependancies = {
			"nvim-treesitter/nvim-treesitter",
		},

		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({
				autoinstall = true,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},
				-- ensure these language parsers are installed
				ensure_installed = {
					"lua",
					"java",
					"c",
					"cpp",
					"css",
					"rust",
					"python",
					"javascript",
					"typescript",
					"json",
					"html",
					"css",
					"latex",
					"vim",
					"vimdoc",
					"zig",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-CR>",
						scope_incremental = "<C-CR>",
						node_incremental = "<TAB>",
						node_decremental = "<S-TAB>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["am"] = "@function.outer",
							["im"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
					},
				},
			})
		end,
	},
}
