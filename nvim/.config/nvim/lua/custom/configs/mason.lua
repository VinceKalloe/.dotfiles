--type mason.options
-- local mason = require("mason")
-- mason.options
--
local options = {
	-- list of servers to install
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",

		-- c/cpp stuff
		"clangd",
		"clang-format",
	},
}

require("mason").setup(options)
