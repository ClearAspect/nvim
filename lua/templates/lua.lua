local utils = require("new-file-template.utils")

local function base_template(relative_path, filename)
	return [[
local M = {}

function M.|cursor|()

end

return M]]
end

local function plugin_template(relative_path, filename)
	return [[
return {
	"author/plugin-name",
	-- dependencies = { "" },
	-- lazy = false,
	-- event = { "VeryLazy" },
	-- ft = { "" },
	config = function()
		-- local plugin_name = require("plugin-name")
		-- plugin_name.setup({
		-- 	-- options
		-- })
		
		|cursor|

	end,
}]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
	local template = {
		{ pattern = ".*plugins/.*", content = plugin_template },
		-- { pattern = ".*",           content = base_template },
	}

	return utils.find_entry(template, opts)
end
