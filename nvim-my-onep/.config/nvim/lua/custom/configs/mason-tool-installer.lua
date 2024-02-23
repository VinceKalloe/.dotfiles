local overrides = require("custom.configs.overrides")

local formatters = overrides.conform.formatters_by_ft
local linters = overrides.nvimlint.linters_by_ft

local ensure_installed = {}

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
}
require("mason-tool-installer").setup(options)
