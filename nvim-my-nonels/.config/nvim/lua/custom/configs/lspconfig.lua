local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "lua_ls",
  "html",
  "cssls",
  "clangd",
  "cmake",
  "rust_analyzer",
  "bashls",
  "pyright",
  "ruby_ls",
  "salt_ls",
  "terraform_lsp",
  "yamlls",
  "ansiblels",
  "docker_compose_language_service",
  "dockerls",
  "marksman",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Without the loop, you would have to manually set up each LSP 
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
