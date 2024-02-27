---@type NvPluginSpec[]

-- ~~~~~~~~~~~~~~~~~~~~
-- ~   UI / UX
-- ~~~~~~~~~~~~~~~~~~~~

local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    -- opts = overrides.nvimtree,
    opts = require "custom.plugins.uix.configs.nvim-tree",
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    init = function()
      require("core.utils").load_mappings "telescope"
    end,
  },

  -- setting up new plugins
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
      require("core.utils").load_mappings "harpoon"
    end,
    -- opts = {},
    config = function()
      require "custom.plugins.uix.configs.harpoon"
    end,
  },

  -- Telescope
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   lazy = false,
  --   init = function()
  --     require("core.utils").load_mappings "Telescope"
  --   end,
  --   opts = function()
  --     local conf = require "plugins.configs.telescope"
  --     local cwd = vim.fn.stdpath "config" .. "/"
  --     local config_dir = { cwd }
  --
  --     conf.pickers = {
  --       findconfig = {
  --         prompt_title = "Find Config",
  --       },
  --       find_files = {
  --         hidden = true,
  --         search_dirs = config_dir,
  --         cwd = cwd,
  --       },
  --     }
  --
  --     return conf
  --   end,
  -- },
}
return plugins
