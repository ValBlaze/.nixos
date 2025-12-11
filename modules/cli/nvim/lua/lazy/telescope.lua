return {
  "telescope.nvim",
  cmd = "Telescope",

  after = function()
    require("telescope").setup()
    local builtin = require("telescope.builtin")
  end,
  keys = {
    {
      "<leader>sf",
      function()
        builtin.find_files()
      end,
    },
    {
      "<leader>s/",
      function()
        builtin.live_grep()
      end,
    },
  },
}
