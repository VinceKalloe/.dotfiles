-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities

-- local lspconfig = require("lspconfig")
-- local overrides = require("custom.plugins.lsp.configs.overrides")
-- local util = require("lspconfig/util")

-- if you just want default config for the servers then put them in a table
-- local lspservers = {
-- 	"lua_ls",
-- 	"html",
-- 	"cssls",
-- 	"tsserver",
-- 	"clangd",
-- 	"yamlls",
-- 	"bashls",
-- 	-- "dockerls",
-- 	"rust_analyzer",
-- 	-- "ansiblels",
-- }
-- local servers = overrides.lspconfig.servers

-- require("mason-lspconfig").setup({
-- 	ensure_installed = servers,
-- })
--
-- for _, lsp in ipairs(lspservers) do
-- 	lspconfig[lsp].setup({
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 	})
-- end
-- lspconfig.lspservers = lspservers
-- return lspconfig
-- lspconfig.rust_analyzer.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "rust" },
-- 	root_dir = util.root_pattern("Cargo.toml"),
-- 	settings = {
-- 		["rust_analyser"] = {
-- 			allFeatures = true,
-- 		},
-- 	},
-- })
--
--
-- lspconfig.pyright.setup { blabla}

local plugins = {
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		-- event = 'VeryLazy',
		dependencies = {
			-- LSP Management
			{ "williamboman/mason.nvim" }, --[[ Package Manager ]]
			{ "williamboman/mason-lspconfig.nvim" }, --[[ To know lspconfig names - for mason-tool-installer ]]
			{ "WhoIsSethDaniel/mason-tool-installer" }, --[[ Automatic install of LSP-stuff ]]
			{ "j-hui/fidget.nvim", opts = {} }, --[[ Useful status updates for LSP ]]
		},

		config = function()
			local lspconfig = require("lspconfig")
			local on_attach = require("plugins.configs.lspconfig").on_attach
			local capabilities = require("plugins.configs.lspconfig").capabilities

			local lspservers = require("custom.plugins.lsp.settings.lspservers")
			-- print(vim.inspect("in LSP"))
			for _, lsp in ipairs(lspservers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					-- handlers = {
					--   -- Add borders to LSP popups
					--   ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'}),
					--   ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded' })
					-- }

					-- require("mason-tool-installer").setup({          })

					-- There is an issue with mason-tools-installer running with VeryLazy
					-- vim.api.nvim_command("MasonToolsInstall")
				})
			end
			-- lspconfig.lspservers = lspservers
			-- Setup servers from settings...
		end,
	},

	-- Tool installer
	-- {
	-- 	"WhoIsSethDaniel/mason-tool-installer",
	-- 	-- dependencies = {
	-- 	-- 	"williamboman/mason.nvim",
	-- 	-- 	"neovim/nvim-lspconfig",
	-- 	-- 	"mfussenegger/nvim-lint",
	-- 	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	-- },
	-- 	lazy = false,
	-- 	opts = require("custom.plugins.lsp.configs.mason-tool-installer"),
	-- 	config = function(_, opts)
	-- 		-- require("custom.plugins.lsp.configs.mason-tool-installer")
	-- 		require("mason-tool-installer").setup(opts)
	-- 	end,
	-- 	-- opts = require("custom.plugins.lsp.configs.mason-tool-installer"),
	-- },

	-- -- Linter
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	-- dependencies = {
	-- 	-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
	-- 	-- },
	-- 	-- enabled = false,
	-- 	event = {
	-- 		"BufReadPre",
	-- 		"BufNewFile",
	-- 	},
	-- 	config = function()
	-- 		require("custom.plugins.lsp.configs.nvim-lint")
	-- 	end,
	-- 	-- opts = require("custom.plugins.lsp.configs.nvim-lint"),
	-- },
}
return plugins
