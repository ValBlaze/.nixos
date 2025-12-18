require('config')
LZN = require('lz.n')
LZN.register_handler(require('handlers.wk'))
LZN.load('plugins')

vim.lsp.enable('lua_ls')
vim.lsp.enable('nixd')
