require('config')

LZN = require('lz.n')
LZN.register_handler(require("handlers.which-key"))
LZN.load('plugins')
