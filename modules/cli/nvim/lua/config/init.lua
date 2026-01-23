-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "

vim.g.have_nerd_font = true

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.usercmds")
require("config.lsp")

local plugin_dir
-- If the mnw wrapper path exists, use it (pure build)
if mnw and vim.loop.fs_stat(mnw.configDir .. "/lua/plugins") then
  plugin_dir = mnw.configDir .. "/lua/plugins"
-- Otherwise fallback to absolute path
elseif
  vim.loop.fs_stat(vim.env.HOME .. "/.nixos/modules/cli/nvim/lua/plugins")
then
  plugin_dir = vim.env.HOME .. "/.nixos/modules/cli/nvim/lua/plugins"
else
  plugin_dir = nil
end

if not plugin_dir then
  print("No plugin folder found!")
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
