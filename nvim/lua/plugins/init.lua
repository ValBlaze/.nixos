local plugins_dir = require("nix-info").settings.config_directory .. "/lua/plugins"
vim.print(plugins_dir)
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
	if (type == "file" or type == "link") and file_name:match("%.lua$") and file_name ~= "init.lua" then
		local module = file_name:gsub("%.lua$", "")
		require("plugins." .. module)
	end
end
