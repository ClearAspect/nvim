-- ╔═════════════════════════════════════════════════╗
-- ║ Configuration Settings         								 ║
-- ╚═════════════════════════════════════════════════╝

-- Tab / Indentation

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = false
vim.opt.wrap = false

-- Folds

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 16

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

-- Language
vim.g.c_syntax_for_h = true

-- ╔═════════════════════════════════════════════════╗
-- ║ AutoCommands 	                								 ║
-- ╚═════════════════════════════════════════════════╝


-- Set initial diagnostic configuration
-- Global variable to track current cursor line
vim.g.current_diagnostic_line = -1

vim.diagnostic.config({
	virtual_text = {
		format = function(diagnostic)
			local line = diagnostic.lnum + 1
			if line == vim.g.current_diagnostic_line then
				return nil -- Don't show virtual text for current line
			end
			return diagnostic.message
		end
	},
	virtual_lines = { only_current_line = true },
})

-- Switch between virtual_text and virtual_lines based on cursor position
vim.api.nvim_create_autocmd({ "CursorHold", "CursorMoved" }, {
	callback = function()
		local current_line = vim.api.nvim_win_get_cursor(0)[1]
		local diagnostics = vim.diagnostic.get(0, { lnum = current_line - 1 })

		if #diagnostics > 0 then
			vim.g.current_diagnostic_line = current_line
		else
			vim.g.current_diagnostic_line = -1
		end
		vim.diagnostic.show() -- Refresh diagnostics display
	end,
})
