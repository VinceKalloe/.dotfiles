--type mason_lspconfig.options
local options = {
  automatic_installation = true,
}
require("mason-lspconfig").setup(options)
