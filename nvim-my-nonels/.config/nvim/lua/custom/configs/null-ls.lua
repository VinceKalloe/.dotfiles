local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.gofmt,
		-- null_ls.builtins.formatting.goimports,
		-- null_ls.builtins.formatting.black,
		-- null_ls.builtins.formatting.prettier,
		-- null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.eslint,
    null_ls.builtins.formatting.clang_format,
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
return opts

-- none_ls.setup({
--   sources = {
--     none_ls.builtins.formatting.stylua,
--     none_ls.builtins.formatting.prettier,
--     none_ls.builtins.diagnostics.erb_lint,
--     none_ls.builtins.diagnostics.eslint_d,
--     none_ls.builtins.diagnostics.rubocop,
--     none_ls.builtins.formatting.rubocop,
--   },
-- })
