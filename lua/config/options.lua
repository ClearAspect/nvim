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

-- Git Diff

vim.opt.fillchars = {
	diff = '╱',
}


vim.opt.diffopt = {
	'algorithm:histogram',
	'internal',
	'indent-heuristic',
	'filler',
	'closeoff',
	'iwhite',
	"vertical",
	'linematch:100',
	'context:12',
}

-- ╔══════════════════╗
-- ║   AutoCommands   ║
-- ╚══════════════════╝
