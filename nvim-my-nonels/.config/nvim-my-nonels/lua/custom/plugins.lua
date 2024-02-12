local plugins = {
  {
    "nvimtools/none-ls.nvim",
    -- event = "VeryLazy",
    ft = {
      "lua",
      "c",
      "go",
      "python",
      -- "java",
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
    },
    opts = function()
      local cust_null_ls = require "custom.configs.null-ls"
      return cust_null_ls
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "clangd",
        "clang-format",
        "codelldb",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",

        -- sys dev
        "c",
        "rust",
        "go",

        -- cnf
        "yaml",
      },
    },
  },
}
return plugins
