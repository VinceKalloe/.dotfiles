local linters_by_ft = {
	-- 	javascript = { "eslint_d" },
	-- 	typescript = { "eslint_d" },
	python = { "pylint" },
	lua = { "luacheck" },
	yaml = { "yamllint" },
	sh = { "shellcheck" },
	-- rust = { "rust_analyzer" },
}

local options = require("lint")
options.linters_by_ft = linters_by_ft

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		options.try_lint()
	end,
})
return options
