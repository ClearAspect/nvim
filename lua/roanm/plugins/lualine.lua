return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependancies = {
		"nvim-tree/nvim-web-devicons",
		opt = true,
	},

	config = function()
		-- local colors = require("catppuccin.palettes").get_palette("mocha")
		local colors = require("oldworld.palette")

		local theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.red, gui = "bold" },
				b = { fg = colors.fg, bg = colors.gray2 },
				c = { fg = colors.fg, bg = colors.gray1 },
			},
			command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
			insert = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
			visual = { a = { fg = colors.bg, bg = colors.magenta, gui = "bold" } },
			terminal = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
			replace = { a = { fg = colors.bg, bg = colors.orange, gui = "bold" } },
			inactive = {
				a = { fg = colors.gray4, bg = colors.bg_dark, gui = "bold" },
				b = { fg = colors.gray4, bg = colors.bg_dark },
				c = { fg = colors.gray4, bg = colors.bg_dark },
			},
		}

		local space = {
			function()
				return " "
			end,
			color = { gui = "italic,bold" },
		}

		local filename = {
			"filename",
			color = { gui = "italic,bold" },
			separator = { left = "", right = "" },
		}

		local filetype = {
			"filetype",
			icons_enabled = false,
			color = { gui = "italic,bold" },
			separator = { left = "", right = "" },
		}

		local branch = {
			"branch",
			icon = "",
			color = { gui = "italic,bold" },
			separator = { left = "", right = "" },
		}

		local location = {

			"location",
			color = { gui = "italic,bold" },
			separator = { left = "", right = "" },
		}

		local diff = {
			"diff",
			color = { gui = "italic,bold" },
			separator = { left = "", right = "" },
			symbols = { added = " ", modified = " ", removed = " " },

			-- diff_color = {
			-- 	added = { fg = colors.green },
			-- 	modified = { fg = colors.yellow },
			-- 	removed = { fg = colors.red },
			-- },
		}

		local mode = {
			"mode",
			icon = "",
			color = { gui = "bold" },
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
			color = { gui = "italic,bold" },
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
			color = { gui = "italic,bold" },
			separator = { left = "" },
		}

		local lsp = {
			function()
				return getLspName()
			end,
			separator = { left = "", right = "" },
			color = { gui = "italic,bold" },
		}

		local command = {
			require("noice").api.status.command.get,
			cond = require("noice").api.status.command.has,
			color = { gui = "italic,bold" },
			separator = { left = "", right = "" },
		}

		require("lualine").setup({
			options = {
				theme = "auto",
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
					mode,
					-- space,
					-- filename,
					-- filetype,
				},
				lualine_b = {
					-- space,
					-- location,
					space,
					branch,
					diff,
				},
				lualine_c = {},
				lualine_x = {

					macro,
					command,
					space,
				},
				lualine_y = {
					dia,
				},
				lualine_z = {
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
