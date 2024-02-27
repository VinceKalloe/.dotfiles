--type nvim-tree.options
-- git support in nvimtree
local options = {
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

return options
