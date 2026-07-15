-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.have_nerd_font = true

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.usercmds")
require("config.lsp")
require("plugins")

-- Pre-Bundled Packages
vim.cmd("packadd! nohlsearch")
vim.cmd("packadd! nvim.undotree")
