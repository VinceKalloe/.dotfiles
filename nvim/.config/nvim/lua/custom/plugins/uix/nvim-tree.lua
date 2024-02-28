local plugins = {
	{
		"nvim-tree/nvim-tree.lua",
		-- Some overrides for nvim-tree
		opts = {
			-- git support in nvimtree
			git = {
				enable = true,
			},
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
					-- Sometimes loose folder icon
					-- glyphs = {
					-- 	folder = {
					-- 		default = "",
					-- 	},
					-- },
				},
			},
		},
	},
}
return plugins
