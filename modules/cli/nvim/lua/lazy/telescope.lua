return {
  "telescope.nvim",
  cmd = "Telescope",

  after = function()
    require("telescope").setup()
  end,
  keys = {
    {
      "<leader>sf",
      function()
        require("telescope.builtin").find_files()
      end,
    },
    {
      "<leader>s/",
      function()
        require("telescope.builtin").live_grep()
      end,
    },
  },
}
