local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"bash",
		"yaml",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.lspconfig = {
	servers = {
		"html",
		"cssls",
		"tsserver",
		"clangd",
		"gopls",
		"bashls",
		"pyright",
		"marksman",
		"yamlls",
		-- "spectral",
	},
}

M.nvimlint = {
	linters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		python = { { "pylint", "pyright" } },
	},
}

M.conform = {
	formatters_by_ft = {
		lua = { "stylua" },

		-- python = { "autopep8" },
		python = { "isort", "autopep8" },
		-- cpp = { "clang-format" },
		-- c = { "clang-format" },
		c = { "ast-grep" },
		cpp = { "ast-grep" },
		go = { "gofumpt" },
		yaml = { "yamlfix" },
		markdown = { "prettierd", "cbfmt" },
	},
	prettier_ft = {
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
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- -- web dev stuff
		-- "css-lsp",
		-- "html-lsp",
		-- "typescript-language-server",
		-- "deno",
		-- "prettier",
		--
		-- -- c/cpp stuff
		-- "clangd",
		-- "clang-format",
		--
		-- -- shell stuff
		-- "shfmt",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
