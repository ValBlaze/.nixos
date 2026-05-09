local neotree = require("neo-tree")
neotree.setup({
  enable_git_status = false,
  filesystem = {
    filtered_items = {
      visible = true,
    },
  },
})

vim.keymap.set(
  "n",
  "<leader>e",
  "<cmd>Neotree reveal<cr>",
  { desc = "Toggle Neotree" }
)
