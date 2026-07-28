require("catppuccin").setup({
	transparent_background = false,
	float = {
		transparent = false,
		solid = true,
	},
	auto_integrations = true, -- Doesn't work on nix
})

vim.cmd.colorscheme("catppuccin")
