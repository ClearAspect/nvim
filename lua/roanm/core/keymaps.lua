-- ╔═════════════════════════════════════════════════╗
-- ║ Leader Key                                      ║
-- ╚═════════════════════════════════════════════════╝
vim.g.mapleader = " "

-- ╔═════════════════════════════════════════════════╗
-- ║ General                                         ║
-- ╚═════════════════════════════════════════════════╝
vim.keymap.set("n", "<c-s>", "<cmd>update<cr>", { desc = "save file" }, { noremap = true })
vim.keymap.set("i", "<c-s>", "<c-o><cmd>update<cr>", { desc = "save file" }, { noremap = true })

-- vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
-- vim.keymap.set({ "n" }, "<Esc>", function()
-- 	vim.cmd("nohlsearch")
-- 	vim.cmd("NoiceDismiss")
-- end, { desc = "Clear Notifications and Remove Search Highlighting" }, { noremap = true })

-- Alt-Backspace functionality
vim.keymap.set("i", "<M-BS>", "<C-o>db", { desc = "Alt-Backspace" })
vim.keymap.set("i", "<M-Del>", "<C-o>dw", { desc = "Alt-Delete" })

-- ╔═════════════════════════════════════════════════╗
-- ║ Tools                                           ║
-- ╚═════════════════════════════════════════════════╝

-- UndoTree
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Open UndoTree" })

-- Alpha.nvim
vim.keymap.set("n", "<leader><ESC>", "<cmd>Alpha<cr>", { desc = "Main Menu" })

-- ╔═════════════════════════════════════════════════╗
-- ║ Buffers                                         ║
-- ╚═════════════════════════════════════════════════╝

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- ╔═════════════════════════════════════════════════╗
-- ║ Find                                            ║
-- ╚═════════════════════════════════════════════════╝
-- vim.keymap.set("n", "<leader>fv", "<cmd>Ex<cr>", { desc = "Open Netrw" })
vim.keymap.set("n", "<leader>fv", "<cmd>Oil<cr>", { desc = "Open Oil" })

--Telescope
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files({
		cwd = require("oil").get_current_dir(),
	})
end, { desc = "Fuzzy Files" })
vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep({
		cwd = require("oil").get_current_dir(),
	})
end, { desc = "Fuzzy Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Fuzzy Help" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Fuzzy Commands" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope frecency<cr>", { desc = "Fuzzy Frequent Files" })

vim.keymap.set(
	"n",
	"<leader>fl",
	"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
	{ desc = "Fuzzy Buffer" }
)
vim.keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").lsp_document_symbols()
end, { desc = "Fuzzy Document Symbols" })
-- { symbols = { "function", "method", "class" } }
vim.keymap.set("n", "<leader>fe", function()
	require("telescope.builtin").diagnostics()
end, { desc = "Fuzzy Errors" })

-- ╔═════════════════════════════════════════════════╗
-- ║ Code                                            ║
-- ╚═════════════════════════════════════════════════╝
--Lusnip
vim.keymap.set({ "i" }, "<C-E>", function()
	require("luasnip").expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-N>", function()
	require("luasnip").jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-P>", function()
	require("luasnip").jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-CR>", function()
	if require("luasnip").choice_active() then
		require("luasnip").change_choice(1)
	end
end, { silent = true })


-- ╔═════════════════════════════════════════════════╗
-- ║ Git                                             ║
-- ╚═════════════════════════════════════════════════╝


vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<cr>", { desc = "Git Status" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>", { desc = "Git Blame" })
vim.keymap.set("n", "<leader>gdo", "<cmd>DiffviewOpen<cr>", { desc = "Open Diff View" })
vim.keymap.set("n", "<leader>gdc", "<cmd>DiffviewClose<cr>", { desc = "Close Diff View" })


-- ╔═════════════════════════════════════════════════╗
-- ║ CopilotChat                                     ║
-- ╚═════════════════════════════════════════════════╝

vim.keymap.set("n", "<leader>cco", "<cmd>CopilotChatOpen<cr>", { desc = "CopilotChat - Open" })
vim.keymap.set("n", "<leader>ccf", "<cmd>CopilotChatFix<cr>", { desc = "CopilotChat - Fix Error" })
vim.keymap.set("n", "<leader>cce", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat - Explain code" })
vim.keymap.set("n", "<leader>ccf", "<cmd>CopilotChatCode<cr>", { desc = "CopilotChat - Review Code" })


vim.keymap.set("n", "<leader>ccq", function()
		local input = vim.fn.input("Quick Chat: ")
		if input ~= "" then
			require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
		end
	end,
	{ desc = "CopilotChat - Quick chat" })



-- copilot
-- vim.keymap.set("i", "<C-L>", ":lua require('copilot.suggestion').accept_word()")
