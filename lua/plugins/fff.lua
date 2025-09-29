return {
	"dmtrKovalenko/fff.nvim",
	lazy = false,
	-- build = "cargo build --release",
	-- or if you are using nixos
	build = "nix run ./#release",
	opts = {
		-- pass here all the options
		-- prompt = "🪿 ",
		prompt = "🍪 ",
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind Files",
		},
	},
}
