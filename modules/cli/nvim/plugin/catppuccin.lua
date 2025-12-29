require("catppuccin").setup({
  flavour = "macchiato",
  transparent_background = true,
  float = {
    transparent = true,
    solid = true,
  },
  integrations = {
    fzf = true,
  },
})

vim.cmd.colorscheme("catppuccin")
