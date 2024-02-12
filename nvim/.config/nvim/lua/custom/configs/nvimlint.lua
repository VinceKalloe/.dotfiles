--type nvimlint.options
local options = {
	linters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		python = { "pyre" },
		yaml = { "yamllint" },
	},
}

require("nvim-lint").setup(options)
