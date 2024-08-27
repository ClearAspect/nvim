return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependancies = {
		"nvim-tree/nvim-web-devicons",
		opt = true,
	},

	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")

		local modecolor = {
			n = colors.blue,
			i = colors.green,
			v = colors.mauve,
			[""] = colors.mauve,
			V = colors.mauve,
			c = colors.peach,
			no = colors.red,
			s = colors.yellow,
			S = colors.yellow,
			[""] = colors.yellow,
			ic = colors.yellow,
			R = colors.red,
			Rv = colors.red,
			cv = colors.red,
			ce = colors.red,
			r = colors.sky,
			rm = colors.sky,
			["r?"] = colors.sky,
			["!"] = colors.red,
			t = colors.maroon,
		}

		local theme = {
			inactive = {
				a = { fg = colors.text, bg = nil },
				b = { fg = colors.text, bg = nil },
				c = { fg = colors.text, bg = nil },
				x = { fg = colors.text, bg = nil },
				y = { fg = colors.text, bg = nil },
				z = { fg = colors.text, bg = nil },
			},
			normal = {
				a = { fg = colors.text, bg = nil },
				b = { fg = colors.text, bg = nil },
				c = { fg = colors.text, bg = nil },
				x = { fg = colors.text, bg = nil },
				y = { fg = colors.text, bg = nil },
				z = { fg = colors.text, bg = nil },
			},
			insert = { a = { fg = colors.base, bg = nil } },
			visual = { a = { fg = colors.base, bg = nil } },
			replace = { a = { fg = colors.base, bg = nil } },
		}

		local space = {
			function()
				return " "
			end,
			color = { bg = nil, fg = colors.text, gui = "bold" },
		}

		local filename = {
			"filename",
			color = { bg = colors.lavender, fg = colors.base, gui = "bold" },
			separator = { left = "", right = "" },
		}

		local filetype = {
			"filetype",
			icons_enabled = false,
			color = { bg = colors.surface0, fg = colors.lavender, gui = "italic,bold" },
			separator = { left = "", right = "" },
		}

		local branch = {
			"branch",
			icon = "",
			color = { bg = colors.green, fg = colors.base, gui = "bold" },
			separator = { left = "", right = "" },
		}

		local location = {

			"location",
			color = { bg = colors.yellow, fg = colors.base, gui = "bold" },
			separator = { left = "", right = "" },
		}

		local diff = {
			"diff",
			color = { bg = colors.surface0, fg = colors.base, gui = "bold" },
			separator = { left = "", right = "" },
			symbols = { added = " ", modified = " ", removed = " " },

			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.yellow },
				removed = { fg = colors.red },
			},
		}

		local modes = {
			"mode",
			icon = "",
			color = function()
				local mode_color = modecolor
				return { bg = mode_color[vim.fn.mode()], fg = colors.base, gui = "bold" }
			end,
			separator = { left = "", right = "" },
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

		local macro = {
			require("noice").api.status.mode.get,
			cond = require("noice").api.status.mode.has,
			color = { fg = colors.lavender, bg = colors.surface0, gui = "italic,bold" },
			separator = { left = "", right = "" },
		}

		local dia = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.yellow },
				info = { fg = colors.mauve },
				hint = { fg = colors.sky },
			},
			color = { bg = colors.surface0, fg = colors.blue, gui = "bold" },
			separator = { left = "" },
		}

		local lsp = {
			function()
				return getLspName()
			end,
			separator = { left = "", right = "" },
			color = { bg = colors.lavender, fg = colors.base, gui = "italic,bold" },
		}

		local command = {
			require("noice").api.status.command.get,
			cond = require("noice").api.status.command.has,
			color = { fg = colors.lavender, bg = colors.surface0, gui = "italic,bold" },
			separator = { left = "", right = "" },
		}

		require("lualine").setup({
			options = {
				theme = theme,
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
			},

			sections = {
				lualine_a = {
					modes,
					-- space,
					-- filename,
					-- filetype,
				},
				lualine_b = {
					-- space,
					-- location,
				},
				lualine_c = {
					space,
					branch,
					diff,
				},
				lualine_x = {},
				lualine_y = {
					macro,
					command,
				},
				lualine_z = {
					space,
					dia,
					lsp,
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
