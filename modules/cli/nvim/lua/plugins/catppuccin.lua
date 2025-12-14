return {
  "catpuccin-nvim",
  colorscheme = "catppuccin",
  after = function ()
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = true,
    })
  end
}
