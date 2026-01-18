require("catppuccin").setup({
  flavour = "macchiato",
  transparent_background = true,
  float = {
    transparent = true,
    solid = true,
  },
  default_integrations = true,
  integrations = {
    noice = true,
    snacks = true,
  },
})

vim.cmd.colorscheme("catppuccin")
