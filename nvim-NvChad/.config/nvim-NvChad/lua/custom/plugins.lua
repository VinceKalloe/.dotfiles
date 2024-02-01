local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

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
  {
    'javiorfo/nvim-soil',
    lazy = true,
    ft = "plantuml",
    config = function()
      require('soil').setup {
        -- If you want to change default configurations
        -- If you want to use Plant UML jar version instead of the install version
        puml_jar = "/usr/share/plantum/plantuml.jar",

        -- If you want to customize the image showed when running this plugin
        image = {
          bg = "transparent",
          darkmode = true, -- Enable or disable darkmode 
          format = "png", -- Choose between png or svg

          -- This is a default implementation of using nsxiv to open the resultant image
          -- Edit the string to use your preferred app to open the image
          -- Some examples:
          -- return "feh " .. img
          -- return "xdg-open " .. img
          execute_to_open = function(img)
            return "nsxiv -b " .. img
          end,
        },
      }
    end,
  },
  -- Optional for puml syntax highlighting:
  -- { 
  --    'javiorfo/nvim-nyctophilia' 
  -- }

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
