-- Syntax Highlighting

-- Local to be nearby
local treesitter_ensure_installed = {
  "vim",
  "lua",
  "html",
  "css",
  "javascript",
  "typescript",
  "tsx",
  "c",
  "cpp",
  "markdown",
  "markdown_inline",
  "regex",
  "bash",
  "go",
  "python",
  "java",
}

return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  opts = function()
    local conf = require "plugins.configs.treesitter"
    conf.ensure_installed = treesitter_ensure_installed
    return conf
  end,
}
