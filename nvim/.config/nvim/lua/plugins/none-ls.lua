return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.completion.spell,

				null_ls.builtins.formatting.prettier,

				null_ls.builtins.code_actions.refactoring,
				null_ls.builtins.code_actions.ltrs,
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.textlint,
        null_ls.builtins.diagnostics.proselint,
        null_ls.builtins.diagnostics.write_good,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.cbfmt,


				null_ls.builtins.diagnostics.clang_check,
				null_ls.builtins.formatting.uncrustify,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.diagnostics.gccdiag,

				null_ls.builtins.diagnostics.ansiblelint,

				null_ls.builtins.formatting.pyflyby,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.pyink,
				null_ls.builtins.formatting.ruff,
				null_ls.builtins.formatting.ruff_format,
				null_ls.builtins.diagnostics.bandit,

				null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.diagnostics.protoc_gen_lint,

				null_ls.builtins.formatting.rustfmt,

				null_ls.builtins.formatting.xmlformat,

				null_ls.builtins.diagnostics.deno_lint,
				null_ls.builtins.diagnostics.spectral,
				null_ls.builtins.diagnostics.vacuum,
				null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.yamlfix,
        null_ls.builtins.formatting.yamlfmt,

        null_ls.builtins.diagnostics.hadolint,

        null_ls.builtins.formatting.pg_format,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
