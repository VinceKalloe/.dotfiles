local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{

		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				enabled = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		-- init = function()
		-- 	require("core.utils").load_mappings("Telescope")
		-- end,
		config = function()
			require("custom.configs.telescope")
		end,
	},

	-- Format
	{
		"stevearc/conform.nvim",
		--  for users those who want auto-save conform + lazyloading!
		-- event = "BufWritePre"
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		event = {
			"BufReadPre",
			"BufNewFile",
			"BufWritePre",
		},
		init = function()
			require("core.utils").load_mappings("Conform")
		end,
		config = function()
			require("custom.configs.conform")
		end,
	},

	-- Lint
	{
		"mfussenegger/nvim-lint",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			require("custom.configs.nvim-lint")
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer",
		dependencies = {
			"williamboman/mason.nvim",
		},
		lazy = false,
		config = function()
			require("custom.configs.mason-tool-installer")
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		lazy = false,
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig") -- Overrided to setup mason-lspconfig
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		lazy = false,
		config = function()
			require("custom.configs.mason-lspconfig")
		end,
	},

	-- Mason plugin manager
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = overrides.mason,
	},

	-- override plugin configs
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		init = function()
			require("core.utils").load_mappings("Harpoon")
		end,
		-- opts = {},
		config = function()
			require("custom.configs.harpoon")
		end,
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
