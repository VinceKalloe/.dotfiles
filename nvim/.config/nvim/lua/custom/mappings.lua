---@type MappingsTable
local M = {}
-- local fn = vim.fn
local cwd = vim.fn.stdpath("config") .. "/"
local config_dir = { cwd }

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- Find in config directory
    ["<leader>fc"] = {
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Config Files",
          search_dirs = config_dir,
          cwd = cwd,
        })
      end,
      "Find Config Files",
      opts = { silent = true },
    },
    -- ["<leader>fo"] = {
    -- 	function()
    -- 		require("telescope.builtin").oldfiles({
    -- 			prompt_title = "Config Files",
    -- 			search_dirs = config_dir,
    -- 			cwd = cwd,
    -- 		})
    -- 	end,
    -- 	"Find Recent Files",
    -- 	opts = { silent = true },
    -- },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- M.dap = {
-- 	plugin = true,
-- 	n = {
-- 		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
-- 		["<leader>dus"] = {
-- 			function()
-- 				local widgets = require("dap.ui.widgets")
-- 				local sidebar = widgets.sidebar(widgets.scopes)
-- 				sidebar.open()
-- 			end,
-- 			"Open debugging sidebar",
-- 		},
-- 		--   ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue", opts = { silent = true } },
-- 		--
-- 		--   ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over", opts = { silent = true } },
-- 		--
-- 		--   ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into", opts = { silent = true } },
-- 		--
-- 		--   ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out", opts = { silent = true } },
-- 		--
-- 		--   ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint", opts = { silent = true } },
-- 		--
-- 		--   ["<leader>dB"] = {
-- 		--     "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
-- 		--     "Breakpoint Condition",
-- 		--     opts = { silent = true },
-- 		--   },
-- 		--
-- 		--   ["<leader>dd"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Dap UI", opts = { silent = true } },
-- 		--
-- 		--   ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last", opts = { silent = true } },
-- 	},
-- }
M.Dap = {
  plugin = true,
  n = {
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue", opts = { silent = true } },

    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over", opts = { silent = true } },

    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into", opts = { silent = true } },

    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out", opts = { silent = true } },

    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint", opts = { silent = true } },

    ["<leader>dB"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      "Breakpoint Condition",
      opts = { silent = true },
    },

    ["<leader>dd"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Dap UI", opts = { silent = true } },

    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last", opts = { silent = true } },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

-- require "plugins.configs.telescope"
-- M.Telescope = {}

-- more keybinds!
M.Conform = {
  plugin = true,
  n = {
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
}

M.Harpoon = {
  plugin = true,
  n = {
    ["<leader>ha"] = {
      function()
        require("harpoon"):list():append()
        vim.notify("   Marked file", vim.log.levels.INFO, { title = "Harpoon" })
      end,
      "Add Mark",
      opts = { silent = true },
    },
    ["<leader>hh"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      "Harpoon Menu",
      opts = { silent = true },
    },
    ["<leader>hn"] = {
      function()
        require("harpoon"):list():next()
      end,
      "Next",
      opts = { silent = true },
    },
    ["<leader>hp"] = {
      function()
        require("harpoon"):list():prev()
      end,
      "Previous",
      opts = { silent = true },
    },
  },
}

return M
