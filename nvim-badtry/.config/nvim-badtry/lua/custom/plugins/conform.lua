-- Formatting
local formatters = {
	lua = { "stylua" },
	python = { "autopep8" },
	cpp = { "clang_format" },
	c = { "clang_format" },
	go = { "gofumpt" },
	yaml = { "yamlfmt" },
}

local prettier_ft = {
	"css",
	"flow",
	"graphql",
	"html",
	"json",
	"javascriptreact",
	"javascript",
	"less",
	"markdown",
	"scss",
	"typescript",
	"typescriptreact",
	"vue",
}

for _, filetype in pairs(prettier_ft) do
	formatters[filetype] = { "prettier" }
end

return {
	"stevearc/conform.nvim",

	init = function()
		require("core.utils").load_mappings("Conform")
	end,

	event = {
		"BufReadPre",
		"BufNewFile",
	},

	opts = {
		format_on_save = {
			-- These options will be passed to conform.format()
			async = true,
			quiet = true,
			lsp_fallback = true,
		},

		formatters_by_ft = formatters,
	},
}
