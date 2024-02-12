--type nvim-lint.options
local options = {
  linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    python = { "pylint" },
  },
}

require("nvim-lint").setup(options)
