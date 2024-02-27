---@type NvPluginSpec[]

-- ~~~~~~~~~~~~~~~~~~~~
-- ~   Lsp
-- ~~~~~~~~~~~~~~~~~~~~

local plugins = {

  -- overriding existant plugins
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lsp.configs.nvim-lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    -- opts = overrides.mason
    opts = require "custom.plugins.lsp.configs.mason",
    -- config = function ()
    --   require "custom.plugins.lsp.configs.mason"
    -- end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- opts = overrides.treesitter,
    opts = require "custom.plugins.lsp.configs.nvim-treesitter",
  },

  -- Install new plugins
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    event = {
      "BufReadPre",
      "BufNewFile",
      "BufWritePre",
    },
    opts = require "custom.plugins.lsp.configs.conform",
    -- config = function()
    --   -- require "custom.configs.conform"
    --   -- require("custom.plugins.lsp.configs.conform").setup()
    --   -- local options = require "custom.plugins.lsp.configs.conform"
    --   -- require("conform").setup(options)
    --   -- options.setup()
    -- end,
  },
}

return plugins
