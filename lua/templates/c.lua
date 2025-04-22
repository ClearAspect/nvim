local utils = require("new-file-template.utils")

local function laurier_header(relative_path, filename)
	-- Create include guard name by converting the filename to uppercase and replacing dots with underscores
	local guard_name = string.upper(string.gsub(filename, "%.", "_"))
	-- In case there are other invalid characters for a macro name, replace them
	guard_name = string.gsub(guard_name, "-", "_")

	return string.format([[
/**
 * -------------------------------------
 * @file %s
 * file description
 * -------------------------------------
 * @author Roan Somers Mason, 169072187, maso2187@mylaurier.ca
 *
 * @version %s
 *
 * -------------------------------------
 */

#ifndef %s
#define %s

|cursor|

#endif /* %s */
  ]], filename, os.date("%Y-%m-%d"), guard_name, guard_name, guard_name)
end

local function laurier_source(relative_path, filename)
	return string.format([[
/**
 * -------------------------------------
 * @file %s
 * file description
 * -------------------------------------
 * @author Roan Somers Mason, 169072187, maso2187@mylaurier.ca
 *
 * @version %s
 *
 * -------------------------------------
 */

|cursor|]], filename, os.date("%Y-%m-%d"))
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
	local template = {
		{ pattern = ".*.c", content = laurier_source },
		{ pattern = ".*.h", content = laurier_header },
	}

	return utils.find_entry(template, opts)
end
