return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      lua = { "stylua" },  -- For Lua files
      c = { "clang_format" },  -- For C files
      python = { "ruff_format" },  -- For Python files
      rust = { "rustfmt" },  -- For Rust files
    },
    -- Format on save
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
