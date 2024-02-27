---@type ChadrcConfig
local M = {}
local headers = require "custom.plugins.uix.configs.headers"
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

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "everforest" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  telescope = { style = "bordered" },
  -- nice statusline
  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
  },
  -- non-lazyload it even when there is the only tab
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = false,
  },
  -- start screen
  nvdash = {
    load_on_startup = true,
    header = get_header(),
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Find Recent", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      -- { "  Find Config", "Spc f c", "Telescope findconfig" },
      {
        "  Find Config",
        "Spc f c",
        function()
          local cwd = vim.fn.stdpath "config" .. "/"
          local config_dir = { cwd }
          require("telescope.builtin").find_files {
            prompt_title = "Config Files",
            search_dirs = config_dir,
            cwd = cwd,
          }
        end,
      },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

-- load all plugins from directory
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
