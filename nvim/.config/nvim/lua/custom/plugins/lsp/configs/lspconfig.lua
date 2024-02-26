local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
-- local overrides = require("custom.plugins.lsp.configs.overrides")
local util = require("lspconfig/util")

-- if you just want default config for the servers then put them in a table
local lspservers = {
	"lua_ls",
	"html",
	"cssls",
	"tsserver",
	"clangd",
	"yamlls",
	"bashls",
	-- "dockerls",
	"rust_analyzer",
	-- "ansiblels",
}
-- local servers = overrides.lspconfig.servers

-- require("mason-lspconfig").setup({
-- 	ensure_installed = servers,
-- })
--
for _, lsp in ipairs(lspservers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
lspconfig.lspservers = lspservers
return lspconfig
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
