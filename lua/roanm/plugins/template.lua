return {
	"glepnir/template.nvim",
	cmd = { "Template", "TemProject" },

	config = function()
		local template = require("template")

		local function CreatePath()
			local separator = package.config:sub(1, 1)
			if separator == "\\" then
				return "C:\\Users\\roanm\\AppData\\Local\\nvim\\lua\\roanm\\templates"
			elseif separator == "/" then
				return "~/.config/nvim/lua/roanm/templates"
			else
				return ""
			end
		end

		template.setup({
			-- config in there

			temp_dir = CreatePath(),

			author = "Roan Mason",
			email = "roanmason@live.ca",
		})
	end,
}
