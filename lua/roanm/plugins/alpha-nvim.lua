return {
	"goolord/alpha-nvim",
	requires = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	config = function()
		local dashboard = require("alpha.themes.dashboard")

		local startify = require("alpha.themes.startify")
		local theme = require("alpha.themes.theta")

		local path_ok, plenary_path = pcall(require, "plenary.path")
		if not path_ok then
			return
		end

		local function createSystemCommand(folder)
			local separator = package.config:sub(1, 1)

			if separator == "\\" then
				if folder == "config" then
					return "<cmd>e ~\\AppData\\Local\\nvim<CR>"
				elseif folder == "git" then
					return "<cmd>e ~\\Documents\\GitHub<CR>"
				end
			elseif separator == "/" then
				if folder == "config" then
					return "<cmd>e ~/.config/nvim<CR>"
				elseif folder == "git" then
					return "<cmd>e ~/Documents/GitHub/<CR>"
				end
			else
				return ""
			end
		end

		local header = {
			{

				[[      |\      _,,,---,,_		]],
				[[ZZZzz /,`.-'`'    -.  ;-;;,_	]],
				[[     |,4-  ) )-,_. ,\ (  `'-'	]],
				[[    '---''(_/--'  `-'\_)		]],
			},
			{
				[[                               __                ]],
				[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
				[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
				[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
				[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
				[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			},
			{
				[[ =================     ===============     ===============   ========  ======== ]],
				[[ \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ]],
				[[ ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ]],
				[[ || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ]],
				[[ ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ]],
				[[ || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ]],
				[[ ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .|| ]],
				[[ || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ]],
				[[ ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.|| ]],
				[[ ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `|| ]],
				[[ ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   || ]],
				[[ ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   || ]],
				[[ ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   || ]],
				[[ ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   || ]],
				[[ ||   .=='    _-'          `-__\._-'         `-_./__-'         `' |. /|  |   || ]],
				[[ ||.=='    _-'                                                     `' |  /==.|| ]],
				[[ =='    _-'                                                            \/   `== ]],
				[[ \   _-'                                                                `-_   / ]],
				[[  `''                                                                      ``'  ]],
			},
		}

		local header = {
			type = "text",
			val = header[1],
			opts = {
				position = "center",
				hl = "Type",
			},
		}

		local buttons = {
			type = "group",
			val = {
				-- { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
				{ type = "text",    val = string.rep("-", 50), opts = { hl = "SpecialComment", position = "center" } },
				dashboard.button("SPC fv", "󰉋  Explore Files", "<cmd>Oil<CR>"),
				dashboard.button("SPC ff", "󰥨  Find File", function() require("fzf-lua").files() end),
				dashboard.button("SPC fg", "󰱼  Find Word", function() require("fzf-lua").grep() end),
				dashboard.button("SPC fr", "  MRU/Frecent Files", function() require("fzf-lua").oldfiles() end),
				dashboard.button("s", "  Config", createSystemCommand("config")),
				{ type = "padding", val = 1 },
				dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
				{ type = "text", val = string.rep("-", 50), opts = { hl = "SpecialComment", position = "center" } },
			},
			position = "center",
		}

		local function get_mru(max_shown)
			local tbl = {
				{ type = "text",    val = "-- Recent Files --", opts = { hl = "SpecialComment", position = "center" } },
				{ type = "padding", val = 1 },
			}

			local mru_list = theme.mru(1, "", max_shown)
			for _, file in ipairs(mru_list.val) do
				table.insert(tbl, file)
				table.insert(tbl, { type = "padding", val = 1 })
			end

			return { type = "group", val = tbl, opts = {} }
		end

		local footer = {
			type = "group",
			val = {},
		}

		local function footer_val()
			local val = {
				{
					type = "text",
					val = "  " .. os.date("%A, %B %d, %Y"),
					opts = { hl = "SpecialComment", position = "center" },
				},
				{
					type = "text",
					val = "  "
						.. string.sub(vim.fn.system("nvim --version | head -n 1"), 1, -2)
						.. "    "
						.. require("lazy").stats().loaded
						.. "/"
						.. require("lazy").stats().count
						.. " Loaded",
					opts = { hl = "SpecialComment", position = "center" },
				},
				{
					type = "text",
					val = (math.floor(require("lazy").stats().startuptime * 100 + 0.5) / 100) .. "ms",
					opts = { hl = "SpecialComment", position = "center" },
				},
			}
			return val
		end

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				vim.defer_fn(function()
					footer.val = footer_val()
					pcall(vim.cmd.AlphaRedraw)
				end, 0)
			end,
		})

		theme.config.layout = {
			{ type = "padding", val = 3 },
			header,
			{ type = "padding", val = 3 },
			get_mru(7),
			{ type = "padding", val = 2 },
			buttons,
			footer,
		}

		require("alpha").setup(theme.config)
	end,
}
