return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "buffers",
				style_preset = bufferline.style_preset.default,
				separator_style = "thin",
				themable = false,
				coloricons = true,
				diagnostics = "nvim_lsp",
				diagnostics_update_on_event = true,
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,

				offsets = {
					{
						filetype = "NvimTree",
						text = "Files",
						text_align = "center",
					},
					{
						filetype = "DiffviewFiles",
						text = "Source Control",
						text_align = "center",
					},
					{
						filetype = "gitsigns-blame",
						text = "Git Blame",
						text_align = "center",
					},
					{
						filetype = "undotree",
						text = "History",
						text_align = "center",
					},
				},
			},
		})
	end,
}
