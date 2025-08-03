return {
	"dmtrKovalenko/fff.nvim",
	-- build = "cargo build --release",
	-- or if you are using nixos
	build = "nix run .#release",
	opts = {
		-- pass here all the options
	},
	-- keys = {
	-- 	{
	-- 		"<leader>ff", -- try it if you didn't it is a banger keybinding for a picker
	-- 		function()
	-- 			require("fff").toggle()
	-- 		end,
	-- 		desc = "Toggle FFF",
	-- 	},
	-- },
}
