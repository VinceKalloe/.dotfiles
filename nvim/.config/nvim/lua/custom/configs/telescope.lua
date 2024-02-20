local options = require("plugins.configs.telescope")
local actions = require("telescope.actions")
-- local trouble = require "trouble.providers.telescope"

options.pickers = {
	oldfiles = {
		prompt_title = "Recent Files",
	},
	find_files = {
		hidden = true,
	},
}

options.defaults.path_display = { "smart" }
options.defaults.file_ignore_patterns = { "node_modules", ".git" }
options.extensions_list = {
	"themes",
	"terms",
	"fzf", --[[ "projects", "persisted", ]]
	"harpoon",
}

options.defaults.mappings.i = {
	["<Tab>"] = actions.move_selection_next,
	["<S-Tab>"] = actions.move_selection_previous,
	-- ["<C-q>"] = trouble.open_with_trouble,
}
return options
