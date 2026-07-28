require("catppuccin").setup({
	transparent_background = false,
	float = {
		transparent = false,
		solid = false,
	},
	auto_integrations = true, -- Doesn't work on nix
})

vim.cmd.colorscheme("catppuccin")
