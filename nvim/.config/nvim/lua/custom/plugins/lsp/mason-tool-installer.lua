-- local overrides = require("custom.configs.overrides")
--
-- local lspservers = require("custom.plugins.lsp.configs.lspconfig").lspservers
-- local formatters = require("custom.plugins.lsp.configs.conform").formatters_by_ft
-- local linters = require("custom.plugins.lsp.configs.nvim-lint").linters_by_ft
--
-- local ensure_installed = {}
--
-- -- print(vim.inspect(ensure_installed))
-- for _, srv in pairs(lspservers) do
-- 	if type(srv) == "string" then
-- 		table.insert(ensure_installed, srv)
-- 	end
-- end
-- -- print(vim.inspect(ensure_installed))
-- for _, fmt in pairs(formatters) do
-- 	if type(fmt) == "table" then
-- 		for _, v in pairs(fmt) do
-- 			table.insert(ensure_installed, v)
-- 		end
-- 	elseif type(fmt) == "string" then
-- 		table.insert(ensure_installed, fmt)
-- 	end
-- end
-- for _, lnt in pairs(linters) do
-- 	if type(lnt) == "table" then
-- 		for _, v in pairs(lnt) do
-- 			table.insert(ensure_installed, v)
-- 		end
-- 	elseif type(lnt) == "string" then
-- 		table.insert(ensure_installed, lnt)
-- 	end
-- end
--
-- local options = {
-- 	ensure_installed = ensure_installed,
-- -- if set to true this will check each tool for updates. If updates
-- -- are available the tool will be updated. This setting does not
-- -- affect :MasonToolsUpdate or :MasonToolsInstall.
-- -- Default: false
-- auto_update = true,
--
-- -- automatically install / update on startup. If set to false nothing
-- -- will happen on startup. You can use :MasonToolsInstall or
-- -- :MasonToolsUpdate to install tools and check for updates.
-- -- Default: true
-- run_on_start = true,
--
-- -- set a delay (in ms) before the installation starts. This is only
-- -- effective if run_on_start is set to true.
-- -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
-- -- Default: 0
-- start_delay = 3000, -- 3 second delay
--
-- -- Only attempt to install if 'debounce_hours' number of hours has
-- -- elapsed since the last time Neovim was started. This stores a
-- -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
-- -- This is only relevant when you are using 'run_on_start'. It has no
-- -- effect when running manually via ':MasonToolsInstall' etc....
-- -- Default: nil
-- debounce_hours = 5, -- at least 5 hours between attempts to install/update
-- }

-- print(vim.inspect(ensure_installed))
-- require("mason-tool-installer").setup(options)

local plugins = {
  -- Automatic install of LSP-stuff
  {
    "WhoIsSethDaniel/mason-tool-installer",
    event = "VeryLazy",
    -- lazy = true, --[[ Don't start by itself. VeryLazy lspconfig will jerk it upon config after being set up ]]
    dependencies = {
      -- LSP Management
      { "williamboman/mason.nvim" }, --[[ Package Manager ]]
      { "williamboman/mason-lspconfig.nvim" }, --[[ To know lspconfig names ]]
    },

    config = function()
      require("mason").setup() --[[ Need Mason to be set up ]]
      require("mason-lspconfig").setup() --[[ May be don't need to set it up even? ]]

      local lspservers = require("custom.plugins.lsp.settings.lspservers")
      local tools_to_install = lspservers

      local formatters_by_ft = require("custom.plugins.lsp.settings.formatters")
      table.insert(tools_to_install, "prettier")
      for _, fmt in pairs(formatters_by_ft) do
        if type(fmt) == "table" then
          for _, v in pairs(fmt) do
            table.insert(tools_to_install, v)
          end
        elseif (type(fmt) == "string") and (fmt ~= "prettier") then
          table.insert(tools_to_install, fmt)
        end
      end

      local linters_by_ft = require("custom.plugins.lsp.settings.linters")
      for _, lnt in pairs(linters_by_ft) do
        if type(lnt) == "table" then
          for _, v in pairs(lnt) do
            table.insert(tools_to_install, v)
          end
        elseif type(lnt) == "string" then
          table.insert(tools_to_install, lnt)
        end
      end

      local options = {
        ensure_installed = tools_to_install,
        -- -- if set to true this will check each tool for updates. If updates
        -- -- are available the tool will be updated. This setting does not
        -- -- affect :MasonToolsUpdate or :MasonToolsInstall.
        -- -- Default: false
        -- auto_update = true,
        --
        -- -- automatically install / update on startup. If set to false nothing
        -- -- will happen on startup. You can use :MasonToolsInstall or
        -- -- :MasonToolsUpdate to install tools and check for updates.
        -- -- Default: true
        -- run_on_start = true,
        --
        -- -- set a delay (in ms) before the installation starts. This is only
        -- -- effective if run_on_start is set to true.
        -- -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
        -- -- Default: 0
        -- start_delay = 3000, -- 3 second delay
        --
        -- -- Only attempt to install if 'debounce_hours' number of hours has
        -- -- elapsed since the last time Neovim was started. This stores a
        -- -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
        -- -- This is only relevant when you are using 'run_on_start'. It has no
        -- -- effect when running manually via ':MasonToolsInstall' etc....
        -- -- Default: nil
        -- debounce_hours = 5, -- at least 5 hours between attempts to install/update
      }

      require("mason-tool-installer").setup(options)

      -- There is an issue with mason-tools-installer running with VeryLazy
      -- print(vim.inspect(require("mason-tool-installer").ensure_installed))
      vim.api.nvim_command("MasonToolsInstall")
    end,
  },
}
return plugins
