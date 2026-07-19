require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.usercmds")
require("config.lsp")
require("plugins")

-- Pre-Bundled Packages
vim.cmd("packadd! nohlsearch")
vim.cmd("packadd! nvim.undotree")
