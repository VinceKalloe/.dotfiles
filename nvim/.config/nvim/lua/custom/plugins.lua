local overrides = require("custom.configs.overrides")
local cmp = require("cmp")

---@type NvPluginSpec[]
local plugins = {
  -- DAP
  --
  --
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },
  -- Rust staff
  -- plugin for old vim - is it needed here?  
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  -- modern rust-tools
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end
  },
  -- rust's crates.io dependancy helper
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  -- insert crates menu in cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
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
        -- "vue", "svelte",

       -- sys dev
        "c",
        "rust",
        "go",
      },
    },
  },
   -- override mason plugin configs
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",
        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- rust
        "rust-analyzer",
        "marksman",
        "cmake-language-server",
        "dockerfile-language-server-nodejs",
        "compose-language-service",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  -- In order to modify the `lspconfig` configuration:
  {
   "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp"
  },


--   -- Override plugin definition options
--
--   {
--     "neovim/nvim-lspconfig",
--     config = function()
--       require "plugins.configs.lspconfig"
--       require "custom.configs.lspconfig"
--     end, -- Override to setup mason-lspconfig
--   },
--
--   -- override plugin configs
--   {
--     "williamboman/mason.nvim",
--     opts = overrides.mason
--   },
--
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = overrides.treesitter,
--   },
--
--   {
--     "nvim-tree/nvim-tree.lua",
--     opts = overrides.nvimtree,
--   },
--
--   -- Install a plugin
--   {
--     "max397574/better-escape.nvim",
--     event = "InsertEnter",
--     config = function()
--       require("better_escape").setup()
--     end,
--   },
--
--   {
--     "stevearc/conform.nvim",
--     --  for users those who want auto-save conform + lazyloading!
--     -- event = "BufWritePre"
--     config = function()
--       require "custom.configs.conform"
--     end,
--   },
--
--   -- To make a plugin not be loaded
--   -- {
--   --   "NvChad/nvim-colorizer.lua",
--   --   enabled = false
--   -- },
--
--   -- All NvChad plugins are lazy-loaded by default
--   -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
--   -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
--   -- {
--   --   "mg979/vim-visual-multi",
--   --   lazy = false,
--   -- }
}

return plugins
