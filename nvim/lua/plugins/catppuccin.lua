require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = false,
	float = {
		solid = false,
		transparent = false,
	},
	default_integrations = true,
	integrations = {
		noice = true,
		snacks = true,
		fidget = true,
	},
})

vim.cmd.colorscheme("catppuccin")
