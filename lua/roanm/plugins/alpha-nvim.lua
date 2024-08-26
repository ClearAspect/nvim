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
					return "<cmd>e ~/dotfiles/.config/nvim<CR>"
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
				{ type = "padding", val = 0 },
				dashboard.button("SPC fv", "󰉋  Explore Files", "<cmd>Oil<CR>"),
				{ type = "padding", val = 1 },
				dashboard.button("SPC ff", "󰥨  Find File", "<cmd>Telescope find_files<CR>"),
				{ type = "padding", val = 1 },
				dashboard.button("SPC fg", "󰱼  Find Word", "<cmd>Telescope live_grep<CR>"),
				{ type = "padding", val = 1 },
				dashboard.button("SPC fr", "  MRU/Frecent Files", "<cmd>Telescope frecency<CR>"),
				{ type = "padding", val = 1 },
				dashboard.button("s", "  Config Settings", createSystemCommand("config")),
				{ type = "padding", val = 1 },
				dashboard.button("SPC q", "  Quit NeoVim", "<cmd>qa<CR>"),
			},
			position = "center",
		}

		local function get_mru(max_shown)
			local tbl = {
				{ type = "text", val = "Recent Files", opts = { hl = "SpecialComment", position = "center" } },
			}

			local mru_list = theme.mru(1, "", max_shown)
			for _, file in ipairs(mru_list.val) do
				table.insert(tbl, file)
				table.insert(tbl, { type = "padding", val = 1 })
			end

			return { type = "group", val = tbl, opts = {} }
		end

		theme.config.layout = {
			{ type = "padding", val = 3 },
			header,
			{ type = "padding", val = 3 },
			buttons,
			{ type = "padding", val = 2 },
			get_mru(10),
		}

		require("alpha").setup(theme.config)
	end,
}
