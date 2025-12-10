return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",

		-- Required dependency for nvim-dap-ui
		"nvim-neotest/nvim-nio",

		-- Language-specific debuggers
		-- "leoluz/nvim-dap-go", -- Golang

		-- Shows variable values inline as virtual text
		"theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		{
			"<leader>Dc",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<leader>Dsi",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<leader>DsO",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<leader>Dso",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<leader>Db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<leader>DB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Set Conditional Breakpoint",
		},
		{
			"<leader>Dt",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: Toggle UI",
		},
		{
			"<leader>Dl",
			function()
				require("dap").run_last()
			end,
			desc = "Debug: Run Last Configuration",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

			args = {
				"--liblldb",
				"/Library/Developer/CommandLineTools/Library/PrivateFrameworks/LLDB.framework/Versions/A/LLDB",
			},
			-- On windows you may have to uncomment this:
			-- detached = false,
		}
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}
		dap.adapters.lldb = {
			type = "executable",
			command = "lldb-dap",
		}

		dap.configurations.c = {
			{
				name = "Launch file (codelldb)",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},

			{
				name = "Launch file (lldb)",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
			-- {
			-- 	name = "Launch (GDB)",
			-- 	type = "gdb",
			-- 	request = "launch",
			-- 	program = function()
			-- 		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- 	end,
			-- 	args = {}, -- provide arguments if needed
			-- 	cwd = "${workspaceFolder}",
			-- 	stopAtBeginningOfMainSubprogram = false,
			-- },
			-- {
			-- 	name = "Select and attach to process (GDB)",
			-- 	type = "gdb",
			-- 	request = "attach",
			-- 	program = function()
			-- 		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- 	end,
			-- 	pid = function()
			-- 		local name = vim.fn.input("Executable name (filter): ")
			-- 		return require("dap.utils").pick_process({ filter = name })
			-- 	end,
			-- 	cwd = "${workspaceFolder}",
			-- },
			-- {
			-- 	name = "Attach to gdbserver :1234 (GDB)",
			-- 	type = "gdb",
			-- 	request = "attach",
			-- 	target = "localhost:1234",
			-- 	program = function()
			-- 		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- 	end,
			-- 	cwd = "${workspaceFolder}",
			-- },
		}

		dap.configurations.cpp = dap.configurations.c
		dap.configurations.rust = dap.configurations.c

		-- optional
		-- require('mason-nvim-dap').setup {
		--     automatic_installation = true,
		--     handlers = {},
		--     ensure_installed = {
		--         'delve',
		--     },
		-- }
		-- Dap UI setup
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		-- Automatically open/close DAP UI
		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Setup virtual text to show variable values inline
		require("nvim-dap-virtual-text").setup()

		-- require("dap-go").setup({
		-- 	delve = {
		-- 		-- Use Mason's delve installation with fallback to system delve
		-- 		path = function()
		-- 			local mason_delve = vim.fn.stdpath("data") .. "/mason/bin/dlv"
		-- 			if vim.fn.executable(mason_delve) == 1 then
		-- 				return mason_delve
		-- 			end
		-- 			-- Fallback to system delve
		-- 			return vim.fn.exepath("dlv") ~= "" and vim.fn.exepath("dlv") or "dlv"
		-- 		end,
		--
		-- 		-- On Windows delve must be run attached or it crashes.
		-- 		-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
		-- 		-- detached = vim.fn.has 'win32' == 0,
		-- 	},
		-- })
	end,
}
