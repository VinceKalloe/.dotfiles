return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    require("go").setup {
      lsp_cfg = {
        capabilities = capabilities,
        -- other setups
      },
      max_line_len = 300,
      lsp_inlay_hints = {
        enable = true,
        only_current_line = true,
        other_hints_prefix = "•",
      },
      trouble = true,
      lsp_keymaps = false,
      diagnostic = {
        hdlr = true,
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false,
      },
      icons = { breakpoint = "", currentpos = "" },
      gocoverage_sign = "│",
      luasnip = true,
      lsp_codelens = true,
    }

    require("core.utils").load_mappings "golang"

    local wk = require "which-key"
    local icons = require "custom.icons"
    wk.register {
      ["<leader>"] = {
        a = { name = "󰟓 Actions" },
        at = { name = icons.kind.Event .. " Test" },
      },
    }
  end,
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
