local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require "lspconfig"
-- local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "markdown", "make", "rust", "go", "terraform", "dockerfile", "yaml" }

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      client.server_capabilities.signatureHelpProvider = false
      on_attach(client, bufnr)
    end,
    capabilities = capabilities,
  }
end


-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local lspconfig = require("lspconfig")
--       lspconfig.tsserver.setup({
--         capabilities = capabilities
--       })
--       lspconfig.html.setup({
--         capabilities = capabilities
--       })
--       lspconfig.lua_ls.setup({
--         capabilities = capabilities
--       })




-- -- Without the loop, you would have to manually set up each LSP 
-- 
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
-- lspconfig.pyright.setup { blabla}
