return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, { desc = "Run to cursor" })

			-- Eval var under cursor
			vim.keymap.set("n", "<leader>?", function()
				require("dapui").eval(nil, { enter = true })
			end, { desc = "Evaluate value under cursor" })

			vim.keymap.set("n", "<F1>", dap.continue, { desc = "Debugger: continue" })
			vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Debugger: step into" })
			vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debugger: step over" })
			vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Debugger: step out" })
			vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Debugger: step back" })
			vim.keymap.set("n", "<F13>", dap.restart, { desc = "Debugger: Restart" })

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
