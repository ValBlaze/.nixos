return {
  'oil.nvim',
  lazy = false,
  keys = {
    { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' }
  },
  after = function ()
    require('oil').setup({
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      -- keymaps = {
      --   ["<leader>sf"] = {
      --     function()
      --       require("telescope.builtin").find_files({
      --         cwd = require("oil").get_current_dir()
      --       })
      --     end,
      --     mode = "n",
      --     nowait = true,
      --     desc = "[S]earch [F]iles in the current directory"
      --   },
      -- }
    })
  end,
}
