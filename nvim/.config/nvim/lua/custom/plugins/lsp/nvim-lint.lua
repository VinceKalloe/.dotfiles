-- local linters_by_ft = {
-- 	-- 	javascript = { "eslint_d" },
-- 	-- 	typescript = { "eslint_d" },
-- 	python = { "pylint" },
-- 	lua = { "luacheck" },
-- 	yaml = { "yamllint" },
-- 	sh = { "shellcheck" },
-- 	-- rust = { "rust_analyzer" },
-- }
--
-- local linter = require("lint")
-- linter.linters_by_ft = linters_by_ft
--
-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
-- 	group = lint_augroup,
-- 	callback = function()
-- 		linter.try_lint()
-- 	end,
-- })
-- return linter

local plugins = {
	-- Linter
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local linter = require("lint")
			linter.linters_by_ft = require("custom.plugins.lsp.settings.linters")

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					linter.try_lint()
				end,
			})
		end,
	},
}
return plugins
