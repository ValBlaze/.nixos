require 'config.options'
require 'config.keymap'
require 'config.autocmds'
require 'config.colorscheme'

require('lze').register_handlers(require('nixCatsUtils.lzUtils').for_cat)
require('lze').register_handlers(require('lzextras').lsp)

require 'config.lsp'

require('lze').load {
  { import = 'plugins.treesitter' },
  { import = 'plugins.blink' },
  { import = 'plugins.conform' },
  { import = 'plugins.telescope' },
  { import = 'plugins.comment' },
  { import = 'plugins.todo-comments' },
  { import = 'plugins.autopairs' },
  { import = 'plugins.which-key' },
  { import = 'plugins.mini' },
  { import = 'plugins.guess-indent' },
  -- { import = 'plugins.fidget' },
  { import = 'plugins.vim-startuptime' },
  { import = 'plugins.gitsigns' },
  { import = 'plugins.inc-rename' },
  { import = 'plugins.noice' },
}
