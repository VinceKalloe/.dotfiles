return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

      require("dap-go").setup()
      require("dapui").setup()

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

			vim.keymap.set("n", "<F5>", dap.continue, {})
			vim.keymap.set("n", "<F10>", dap.step_over, {})
			vim.keymap.set("n", "<F11>", dap.step_into, {})
			vim.keymap.set("n", "<F12>", dap.step_out, {})
			vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<Leader>B", dap.set_breakpoint, {})
      vim.keymap.set('n', '<Leader>lp',
        function()
          dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end, {})
			vim.keymap.set("n", "<Leader>dr", dap.repl.open, {})
			vim.keymap.set("n", "<Leader>dl", dap.run_last, {})
			--    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
			--      require('dap.ui.widgets').hover()
			--    end)
			--    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
			--      require('dap.ui.widgets').preview()
			--    end)
			--    vim.keymap.set('n', '<Leader>df', function()
			--      local widgets = require('dap.ui.widgets')
			--      widgets.centered_float(widgets.frames)
			--    end)
			--    vim.keymap.set('n', '<Leader>ds', function()
			--      local widgets = require('dap.ui.widgets')
			--      widgets.centered_float(widgets.scopes)
			--    end)

			vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
        local widgets = require('dap.ui.widgets')
        widgets.hover()
		  end, {})
			vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
        local widgets = require('dap.ui.widgets')
			  widgets.preview()
			end)
			vim.keymap.set('n', '<Leader>df', function()
			  local widgets = require('dap.ui.widgets')
			  widgets.centered_float(widgets.frames)
			end)
			vim.keymap.set('n', '<Leader>ds', function()
			  local widgets = require('dap.ui.widgets')
			  widgets.centered_float(widgets.scopes)
			end)

		end,
	},
}
