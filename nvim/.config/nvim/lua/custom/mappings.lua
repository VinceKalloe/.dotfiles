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
		-- 			-- prompt_title = "Config Files",
		-- 			-- search_dirs = config_dir,
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
