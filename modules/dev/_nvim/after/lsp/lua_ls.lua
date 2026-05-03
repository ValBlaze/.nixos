---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      formatters = {
        ingoreComments = true,
      },
      signatureHelp = { enabled = true },
      diagnostics = {
        globals = { "vim" },
        disable = { 'missing-fields' }
      },
      telemetry = { enabled = false }
    }
  }
}
