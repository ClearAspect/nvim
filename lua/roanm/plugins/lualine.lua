return {
	"nvim-lualine/lualine.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependancies = {
		"nvim-tree/nvim-web-devicons",
		opt = true,
	},

	config = function()
		-- local colors = require("catppuccin.palettes").get_palette("mocha")
		-- local colors = require("oldworld.palette")

		--[[ OneHalf
			                        light     dark
			0   normal  black       #383a42   #282c34
			1   normal  red         #e45649   #e06c75
			2   normal  green       #50a14f   #98c379
			3   normal  yellow      #c18401   #e5c07b
			4   normal  blue        #0184bc   #61afef
			5   normal  magenta     #a626a4   #c678dd
			6   normal  cyan        #0997b3   #56b6c2
			7   normal  white       #fafafa   #dcdfe4
						foreground  #383a42   #dcdfe4
						background  #fafafa   #282c34
		--]]

		local onehalfPalette = {
			blackLight = "#383a42",
			blackDark = "#282c34",
			redLight = "#e45649",
			redDark = "#e06c75",
			greenLight = "#50a14f",
			greenDark = "#98c379",
			yellowLight = "#c18401",
			yellowDark = "#e5c07b",
			blueLight = "#0184bc",
			blueDark = "#61afef",
			magentaLight = "#a626a4",
			magentaDark = "#c678dd",
			cyanLight = "#0997b3",
			cyanDark = "#56b6c2",
			whiteLight = "#fafafa",
			whiteDark = "#dcdfe4",
			foregroundLight = "#383a42",
			foregroundDark = "#dcdfe4",
			backgroundLight = "#fafafa",
			backgroundDark = "#282c34",

		}
		local onehalfdarkTheme = {
			normal = {
				a = { fg = onehalfPalette.backgroundDark, bg = onehalfPalette.blueDark, gui = "bold" },
			},
			command = { a = { fg = onehalfPalette.backgroundDark, bg = onehalfPalette.redDark, gui = "bold" } },
			insert = { a = { fg = onehalfPalette.backgroundDark, bg = onehalfPalette.greenDark, gui = "bold" } },
			visual = { a = { fg = onehalfPalette.backgroundDark, bg = onehalfPalette.blueDark, gui = "bold" } },
			terminal = { a = { fg = onehalfPalette.backgroundDark, bg = onehalfPalette.yellowDark, gui = "bold" } },
			replace = { a = { fg = onehalfPalette.backgroundDark, bg = onehalfPalette.backgroundDark, gui = "bold" } },
			inactive = {
				a = { fg = onehalfPalette.gray4, bg = onehalfPalette.backgroundDark, gui = "bold" },
				b = { fg = onehalfPalette.gray4, bg = onehalfPalette.backgroundDark },
				c = { fg = onehalfPalette.gray4, bg = onehalfPalette.backgroundDark },
			},



		}


		--[[
	
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

		--]]

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
				error = { fg = onehalfPalette.redDark },
				warn = { fg = onehalfPalette.yellowDark },
				info = { fg = onehalfPalette.magentaDark },
				hint = { fg = onehalfPalette.cyanDark },
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
				-- theme = onehalfdarkTheme,
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
