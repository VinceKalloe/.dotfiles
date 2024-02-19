--type conform.options

local overrides = require("custom.configs.overrides")

-- local prettier_ft = {
-- 	"css",
-- 	"flow",
-- 	"graphql",
-- 	"html",
-- 	"json",
-- 	"javascriptreact",
-- 	"javascript",
-- 	"less",
-- 	"markdown",
-- 	"scss",
-- 	"typescript",
-- 	"typescriptreact",
-- 	"vue",
-- }
-- local formatters = {
-- 	lua = { "stylua" },
-- 	python = { "autopep8" },
-- 	cpp = { "clang_format" },
-- 	c = { "clang_format" },
-- 	go = { "gofumpt" },
-- 	yaml = { "yamlfmt" },
-- }
-- for _, filetype in pairs(prettier_ft) do
-- 	formatters[filetype] = { "prettier" }
-- end
local prettier_ft = overrides.conform.prettier_ft
local formatters = overrides.conform.formatters_by_ft

<<<<<<< HEAD
for _, filetype in pairs(prettier_ft) do
	formatters[filetype] = { "prettier" }
=======
-- print(vim.inspect(formatters))
for _, filetype in pairs(prettier_ft) do
	if filetype ~= nil then
		formatters[filetype] = { "prettier" }
	end
>>>>>>> bc735ef (new)
end

require("mason-tool-installer").setup({
	ensure_installed = formatters,
})

local options = {
	lsp_fallback = true,

	formatters_by_ft = formatters,

	-- adding same formatter for multiple filetypes can look too much work for some
	-- instead of the above code you could just use a loop! the config is just a table after all!

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 1000,
		async = false,
		lsp_fallback = true,
	},
}

require("conform").setup(options)
