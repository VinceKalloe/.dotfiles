---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

local headers = require "custom.core.headers"
local function get_header()
  -- if vim.g.random_header then
  if true then
    local headerNames = {}
    for name, _ in pairs(headers) do
      table.insert(headerNames, name)
    end

    local randomName = headerNames[math.random(#headerNames)]
    local randomHeader = headers[randomName]
    return randomHeader
  else
    return headers["nvchad"]
  end
end

M.ui = {
  theme = 'gruvbox',
  theme_toggle = { "gruvbox", "one_light" },
  telescope = {style = "bordered"},
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
  },


  hl_override = highlights.override,
  hl_add = highlights.add,
  -- lazyload it when there are 1+ tabs
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
  },
  nvdash = {
    load_on_startup = true,
    header = get_header(),
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Find Config", "Spc f c", "Telescope config_files" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
