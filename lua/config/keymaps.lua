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
-- ║ Buffers/Tabs                                    ║
-- ╚═════════════════════════════════════════════════╝

vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "Next Tab" })
