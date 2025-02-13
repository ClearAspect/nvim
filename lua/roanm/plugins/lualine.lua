return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependancies = {
		"nvim-tree/nvim-web-devicons",
		opt = true,
	},

	config = function()
		local C = require("onehalf.colors.onehalfdark")

		local onehalfdark = {}

		onehalfdark.normal = {
			a = { bg = C.gutter_fg, fg = C.bg, gui = "bold" },
			b = { bg = C.non_text, fg = C.gutter_fg },
			c = { bg = C.non_text, fg = C.fg },
		}

		onehalfdark.insert = {
			a = { bg = C.gutter_fg, fg = C.bg, gui = "bold" },
			b = { bg = C.non_text, fg = C.gutter_fg },
			c = { bg = C.non_text, fg = C.fg },
		}

		onehalfdark.visual = {
			a = { bg = C.gutter_fg, fg = C.bg, gui = "bold" },
			b = { bg = C.non_text, fg = C.gutter_fg },
			c = { bg = C.non_text, fg = C.fg },
		}

		onehalfdark.replace = {
			a = { bg = C.yellow, fg = C.bg, gui = "bold" },
			b = { bg = C.non_text, fg = C.yellow },
			c = { bg = C.non_text, fg = C.fg },
		}

		onehalfdark.command = {
			a = { bg = C.gutter_fg, fg = C.bg, gui = "bold" },
			b = { bg = C.non_text, fg = C.gutter_fg },
			c = { bg = C.non_text, fg = C.fg },
		}

		onehalfdark.terminal = {
			a = { bg = C.gutter_fg, fg = C.bg, gui = "bold" },
			b = { bg = C.non_text, fg = C.gutter_fg },
			c = { bg = C.non_text, fg = C.fg },
		}


		onehalfdark.inactive = {
			a = { bg = C.bg, fg = C.gutter_fg },
			b = { bg = C.non_text, fg = C.black, gui = "bold" },
			c = { bg = C.bg, fg = C.black },
		}

		local mode = {
			"mode",
			icon = "",
			color = { gui = "bold" },
		}

		local function getLspName()
			local language_servers = ""
			local lsp = vim.lsp.buf_get_clients()
			if lsp then
				for _, client in pairs(lsp) do
					-- exclude copilot

					if client.name ~= "GitHub Copilot" then
						language_servers = language_servers .. client.name .. ", "
					end
				end
			end

			language_servers = string.sub(language_servers, 1, -3)

			if language_servers == "" then
				language_servers = "  No servers"
			end

			return "  " .. language_servers
		end

		local dia = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			diagnostics_color = {
				error = { fg = C.red },
				warn = { fg = C.yellow },
				info = { fg = C.magenta },
				hint = { fg = C.cyan },
			},
			color = { gui = "italic,bold" },
			separator = { left = "" },
		}

		local lsp = {
			function()
				return getLspName()
			end,
			color = { gui = "italic,bold" },
		}


		require("lualine").setup({
			options = {
				theme = onehalfdark,
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = { lualine_a = { mode } }

		})
	end,
}
