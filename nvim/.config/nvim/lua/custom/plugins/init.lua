-- return {
-- 	require("custom.plugins.uix"),
-- 	require("custom.plugins.lsp"),
-- 	require("custom.plugins.dap"),
-- 	{ import = "custom.plugins.lsp" },
-- }
local plugins = {
  { import = "custom.plugins.lsp" },
  -- { import = "custom.plugins.lsp.conform" },
  { import = "custom.plugins.dap" },
  { import = "custom.plugins.uix" },
}
return plugins
