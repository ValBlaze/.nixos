return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  after = function ()
    require("nvim-autopairs").setup()
  end
}
