local plugins = {
	{
		"williamboman/mason.nvim",
		-- config = function()
		-- 	local options = require("plugins.configs.mason")
		-- 	options.ui = {
		-- 		icons = {
		-- 			package_installed = "✓",
		-- 			package_pending = "➜",
		-- 			package_uninstalled = "✗",
		-- 		},
		-- 		border = "single",
		-- 	}
		-- 	require("mason").setup(options)
		-- end,
		opts = {
			ui = {
				icons = {
					-- package_installed = "✓",
					-- package_pending = "➜",
					-- package_uninstalled = "✗",
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
				border = "single",
			},
		},
	},
}
return plugins
