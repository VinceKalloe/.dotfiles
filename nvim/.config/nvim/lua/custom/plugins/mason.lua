-- LSP plugin manager

-- Local to be nearby
local mason_ensure_installed = {
	"vim",
	"lua",
	"html",
	"css",
	"javascript",
	"typescript",
	"tsx",
	"c",
	"cpp",
	"markdown",
	"markdown_inline",
	"regex",
	"bash",
	"go",
	"python",
	"java",
}
return {

	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("plugins.configs.mason")
		mason.ensure_installed = mason_ensure_installed
		-- import mason-lspconfig
		-- local mason_lspconfig = require("custom.plugins.mason-lspconfig")

		-- import mason-tool-installer
		-- local mason_tool_installer = require("custom.plugins.mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			-- ui = {
			--   icons = {
			--     package_installed = "✓",
			--     package_pending = "➜",
			--     package_uninstalled = "✗",
			--   },
			-- },
		})

		-- mason_lspconfig.setup({
		--   -- list of servers for mason to install
		--   ensure_installed = {
		--     "tsserver",
		--     "html",
		--     "cssls",
		--     "tailwindcss",
		--     "svelte",
		--     "lua_ls",
		--     "graphql",
		--     "emmet_ls",
		--     "prismals",
		--     "pyright",
		--   },
		--   -- auto-install configured servers (with lspconfig)
		--   automatic_installation = true, -- not the same as ensure_installed
		-- })

		-- mason_tool_installer.setup({
		--   ensure_installed = {
		--     "prettier", -- prettier formatter
		--     "stylua", -- lua formatter
		--     "isort", -- python formatter
		--     "black", -- python formatter
		--     "pylint", -- python linter
		--     "eslint_d", -- js linter
		--   },
		-- })
	end,
	-- 	config = function()
	-- 		require("custom.plugins.mason-lspconfig")
	-- 	end,
	-- enabled = true,
	-- opts = function()
	-- 	local conf = require("plugins.configs.mason")
	-- 	conf.ensure_installed = mason_ensure_installed
	-- 	return conf
	-- end,
}
