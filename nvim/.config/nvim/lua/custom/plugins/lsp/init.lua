local plugins = {

  -- Mason plugin manager
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	-- lazy = false,
  -- 	-- config = function()
  -- 	-- 	require("custom.plugins.lsp.configs.mason")
  -- 	-- end,
  -- 	opts = require("custom.plugins.lsp.configs.mason"),
  -- },
  {
    "WhoIsSethDaniel/mason-tool-installer",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-lint",
      "williamboman/mason-lspconfig.nvim",
    },
    lazy = false,
    config = function()
      require("custom.plugins.lsp.configs.mason-tool-installer")
    end,
    -- opts = require("custom.plugins.lsp.configs.mason-tool-installer"),
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    -- 	"williamboman/mason-lspconfig.nvim",
    -- 	"WhoIsSethDaniel/mason-tool-installer",
    -- },
    -- lazy = false,
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.plugins.lsp.configs.lspconfig")
    end,
  },
  -- {
  -- 	"williamboman/mason-lspconfig.nvim",
  -- 	-- dependencies = {
  -- 	-- 	"williamboman/mason.nvim",
  -- 	-- },
  -- 	-- lazy = false,
  -- 	-- config = function()
  -- 	-- 	require("custom.configs.mason-lspconfig")
  -- 	-- end,
  -- },

  -- Formater
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    -- dependencies = {
    -- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
    -- },
    event = {
      "BufReadPre",
      "BufNewFile",
      "BufWritePre",
    },
    init = function()
      require("core.utils").load_mappings("Conform")
    end,
    -- config = function()
    -- 	require("custom.plugins.lsp.configs.conform")
    -- end,
    opts = require("custom.plugins.lsp.configs.conform"),
  },

  -- Linter
  {
    "mfussenegger/nvim-lint",
    -- dependencies = {
    -- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
    -- },
    -- enabled = false,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require("custom.plugins.lsp.configs.nvim-lint")
    end,
    -- opts = require("custom.plugins.lsp.configs.nvim-lint"),
  },
}
return plugins
