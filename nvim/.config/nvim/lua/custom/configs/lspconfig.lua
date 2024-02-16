local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local overrides = require("custom.configs.overrides")

-- if you just want default config for the servers then put them in a table
-- local servers = { --[[ "lua_ls", ]]
-- 	"html",
-- 	"cssls",
-- 	"tsserver",
-- 	"clangd",
-- }
local servers = overrides.lspconfig.servers

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

--
-- lspconfig.pyright.setup { blabla}
