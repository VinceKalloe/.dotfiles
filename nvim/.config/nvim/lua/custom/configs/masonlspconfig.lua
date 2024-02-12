--type masonlspconfig.options
local options = {
	-- list of servers for mason to install
	ensure_installed = {
		-- "tsserver",
		-- "html",
		-- "cssls",
		-- "tailwindcss",
		-- "svelte",
		"lua_ls",
		"bashls",
		"graphql",
		"marksman",
		"yamlls",
		-- "emmet_ls",
		-- "prismals",
		-- "pyright",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
}
require("mason-lspconfig").setup(options)
