local plugins = { -- Harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		init = function()
			require("core.utils").load_mappings("harpoon")
		end,
		opts = {},
		-- config = function()
		-- 	require("custom.plugins.uix.harpoon")
		-- end,
		config = function(_, opts)
			require("harpoon").setup(opts)
		end,
	},
}
return plugins
