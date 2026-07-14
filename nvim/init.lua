-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.have_nerd_font = true

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.usercmds")
require("config.lsp")

local plugin_dir = require(vim.g.nix_info_plugin_name)(nil, "settings", "config_directory") .. "/lua/plugins"

if not plugin_dir then
	print("No plugin folder found! Please check plugin loader path in init.lua.")
	return
end

-- Auto-require files
local plugin_files = vim.fn.glob(plugin_dir .. "/*.lua", true, true)
for _, file in ipairs(plugin_files) do
	local name = vim.fn.fnamemodify(file, ":t:r")
	if name ~= "init" then
		local ok, err = pcall(require, "plugins." .. name)
		if not ok then
			print("Failed to require plugin:", name, err)
		end
	end
end

-- Pre-Bundled Packages
vim.cmd("packadd! nohlsearch")
vim.cmd("packadd! nvim.undotree")
