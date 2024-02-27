local prettier_ft = {
	"css",
	"flow",
	"graphql",
	"html",
	"json",
	"javascriptreact",
	"javascript",
	"less",
	-- "markdown",
	"scss",
	"typescript",
	"typescriptreact",
	"vue",
}

local formatters_by_ft = {
	lua = { "stylua" },
	-- python = { "autopep8" },
	python = { "isort", "black" },
	cpp = { "clang-format" },
	c = { "clang-format" },
	go = { "gofumpt" },
	yaml = { "yamlfix" },
	sh = { "shellharden" },
	rust = { "ast-grep" },
}

for _, filetype in pairs(prettier_ft) do
	formatters_by_ft[filetype] = { "prettier" }
end

return formatters_by_ft
