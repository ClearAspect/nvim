-- Tab / Indentation

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.wrap = false

-- Search

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.g.have_nerd_font = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 250
vim.opt.showmode = false
vim.opt.signcolumn = "yes"

-- Tweaks

vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.backspace = { "start", "eol", "indent" }

-- Splits

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

-- ╔═════════════════════════════════════════════════╗
-- ║ AutoCommands 									 ║
-- ╚═════════════════════════════════════════════════╝

-- Set initial diagnostic configuration
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})

-- Switch between virtual_text and virtual_lines based on cursor position
vim.api.nvim_create_autocmd({ "CursorHold", "CursorMoved" }, {
	callback = function()
		local current_line = vim.api.nvim_win_get_cursor(0)[1]
		local diagnostics = vim.diagnostic.get(0, { lnum = current_line - 1 })

		if #diagnostics > 0 then
			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = { only_current_line = true },
			})
		else
			vim.diagnostic.config({
				virtual_text = true,
				virtual_lines = false,
			})
		end
	end,
})
