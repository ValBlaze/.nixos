require('conform').setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },

  formatters_by_ft = {
    lua = { 'stylua' },
  },
  vim.keymap.set('n', '<leader>f', function(args)
    require('conform').format({ bufnr = args.buf })
  end, { desc = '[F]ormat file' }),
})
