return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "cmake" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local project_actions = require("telescope._extensions.project.actions")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {

					prompt_position = "top",
					height = 0.80,
					width = 0.8,
					horizontal = {
						mirror = false,
					},
					vertical = {
						mirror = false,
					},
				},
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-d>"] = actions.delete_buffer, -- delete buffer
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				buffers = {
					theme = "dropdown",
					previewer = false,
					path_display = { "smart" },
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,    -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
				project = {
					hidden_files = false,
					theme = "dropdown",
					order_by = "recent",
					search_by = "title",
					on_project_selected = function(prompt_bufnr)
						project_actions.find_project_files(prompt_bufnr, false)
						-- project_actions.change_working_directory(prompt_bufnr)
						-- vim.cmd("%bw!")
					end,
				},
			},
		})

		telescope.load_extension("frecency")
		telescope.load_extension("find_template")
		telescope.load_extension("ui-select")
	end,
}
