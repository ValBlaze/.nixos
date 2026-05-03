require("conform").setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    nix = { "nixfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    -- cmake = { "cmake-format" },
  },
})
