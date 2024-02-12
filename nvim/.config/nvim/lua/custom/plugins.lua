-- local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"stevearc/conform.nvim",
		--  for users those who want auto-save conform + lazyloading!
		-- event = "BufWritePre"
		-- event = { "BufWritePre" },
		event = {
			"BufReadPre",
			"BufNewFile",
			-- "BufWritePre",
		},
		config = function()
			require("custom.configs.conform")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		-- dependencies = {
		-- 	"williamboman/mason.nvim",
		-- },
		config = function()
			require("custom.configs.nvimlint")
		end,
	},

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("custom.configs.masonlspconfig")
	-- 	end,
	-- },

	{
		"williamboman/mason-tool-installer.nvim",
		lazy = false,
		config = function()
			require("custom.configs.masontoolinstaller")
		end,
	},

	{
		-- dependencies = {
		-- 	"williamboman/mason-lspconfig.nvim",
		-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- },
		"williamboman/mason.nvim",
		-- opts = overrides.mason,
		config = function()
			require("plugins.configs.mason")
			require("custom.configs.mason")
			-- require("custom.configs.masonlspconfig")
			-- require("custom.configs.masontoolinstaller")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
			require("custom.configs.treesitter")
		end,
		-- opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugins.configs.nvimtree")
			require("custom.configs.nvimtree")
		end,
		-- opts = overrides.nvimtree,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
}

return plugins
