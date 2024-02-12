--type nvim-tree.options
local options = {
	filters = {
		exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
	},
	git = {
		enable = true,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
			glyphs = {
				folder = {
					default = "",
				},
			},
		},
	},
}
require("nvim-tree").setup(options)
