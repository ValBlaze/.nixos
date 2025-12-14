return {
  "catppuccin-nvim",
  lazy = false,
  after = function ()
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = false,
    })

    vim.cmd.colorscheme("catppuccin")
  end
}
