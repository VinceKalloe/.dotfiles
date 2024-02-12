--type lspconfig.options
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- -- if you just want default config for the servers then put them in a table
local lsp_servers = { "html", "cssls", "tsserver", "clangd", "yamlls", "gopls", "marksman", "bashls" }

require("custom.configs.masonlspconfig").setup({
	ensure_installed = lsp_servers,
	automatic_installation = true,
})

for _, lsp in ipairs(lsp_servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

--
-- lspconfig.pyright.setup { blabla}
