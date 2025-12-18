return {
  "telescope.nvim",
  cmd = "Telescope",
  after = function()
    require("telescope").setup()
  end,
  require("which-key").add {
    { "<leader>s", group = '[S]earch' },
  },
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
