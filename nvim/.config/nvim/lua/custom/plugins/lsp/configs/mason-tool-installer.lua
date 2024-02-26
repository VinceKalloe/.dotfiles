-- local overrides = require("custom.configs.overrides")
--
local lspservers = require("custom.plugins.lsp.configs.lspconfig").lspservers
local formatters = require("custom.plugins.lsp.configs.conform").formatters_by_ft
local linters = require("custom.plugins.lsp.configs.nvim-lint").linters_by_ft

local ensure_installed = {}

print(vim.inspect(ensure_installed))
for _, srv in pairs(lspservers) do
	if type(srv) == "string" then
		table.insert(ensure_installed, srv)
	end
end
print(vim.inspect(ensure_installed))
for _, fmt in pairs(formatters) do
	if type(fmt) == "table" then
		for _, v in pairs(fmt) do
			table.insert(ensure_installed, v)
		end
	elseif type(fmt) == "string" then
		table.insert(ensure_installed, fmt)
	end
end
for _, lnt in pairs(linters) do
	if type(lnt) == "table" then
		for _, v in pairs(lnt) do
			table.insert(ensure_installed, v)
		end
	elseif type(lnt) == "string" then
		table.insert(ensure_installed, lnt)
	end
end

local options = {
	ensure_installed = ensure_installed,
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

print(vim.inspect(ensure_installed))
require("mason-tool-installer").setup(options)
-- local options = {}
-- return options
