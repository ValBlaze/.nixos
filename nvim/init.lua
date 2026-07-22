-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

require("config")
require("plugins")

-- Pre-Bundled Packages
vim.cmd("packadd! nohlsearch")
vim.cmd("packadd! nvim.undotree")
