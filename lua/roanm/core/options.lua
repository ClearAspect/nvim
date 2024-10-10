-- Tab / Indentation

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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

-- Disable virtual text since it's redundant due to lsp_lines.nvim
vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		local floating = vim.api.nvim_win_get_config(0).relative ~= ""
		vim.diagnostic.config({
			virtual_text = floating,
			virtual_lines = not floating,
		})
	end,
})
