require("tiny-inline-diagnostic").setup({
  transparent_bg = true,
  options = {
    show_source = {
      enabled = true,
      if_many = true,
    },
    use_icons_from_diagnostic = true,
    multilines = {
      enabled = true,
    },
  },
})
vim.diagnostic.config({ virtual_text = false })
