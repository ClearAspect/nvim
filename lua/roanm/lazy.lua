-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "roanm.plugins" },
		{ import = "roanm.plugins.lsp" },
		{ import = "roanm.plugins.gpt" },
		{ import = "roanm.plugins.git" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "onehalftest" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = false },
	change_detection = { enabled = true, notify = false },
})

-- vim.cmd("colorscheme catppuccin-mocha")
vim.cmd("colorscheme onehalftest")
-- vim.cmd("Copilot disable")

vim.lsp.set_log_level("debug")
