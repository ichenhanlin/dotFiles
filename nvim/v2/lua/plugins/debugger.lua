if vim.g.vscode then
	return {}
else
	return {
		{
			{
				"mfussenegger/nvim-dap",
			},
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = {
					"mfussenegger/nvim-dap",
					"williamboman/mason.nvim",
				},
				opts = {
					ensure_installed = { "delve" },
					handlers = {},
				},
			},
			{
				"leoluz/nvim-dap-go",
				ft = "go",
				opts = {},
			},
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"nvim-neotest/nvim-nio",
					"mfussenegger/nvim-dap",
				},
				config = function()
					local dap, dapui = require("dap"), require("dapui")
					dapui.setup()
					dap.listeners.before.attach.dapui_config = function()
						dapui.open()
					end
					dap.listeners.before.launch.dapui_config = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated.dapui_config = function()
						dapui.close()
					end
					dap.listeners.before.event_exited.dapui_config = function()
						dapui.close()
					end
					local sign = vim.fn.sign_define

					sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
					sign(
						"DapBreakpointCondition",
						{ text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
					)
					sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
				end,
			},
		},
	}
end
