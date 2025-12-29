require("snacks").setup({
  picker = {},
  image = {},
  indent = {},
  scope = {},
  scroll = {},
})

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

map("n", "<leader><space>", Snacks.picker.buffers, "[ ] Find Buffers")
map("n", "<leader>sf", Snacks.picker.files, "[S]earch [F]iles")
map("n", "<leader>sh", Snacks.picker.help, "[S]earch [H]elp")
map("n", "<leader>sk", Snacks.picker.keymaps, "[S]earch [K]eymaps")
map("n", "<leader>ss", Snacks.picker.pickers, "[S]earch [S]elect Picker")
map("n", "<leader>sg", Snacks.picker.grep, "[S]earch by [G]rep")
map("n", "<leader>sz", Snacks.picker.zoxide, "[S]earch by [Z]oxide")
map("n", "<leader>sd", Snacks.picker.diagnostics, "[S]earch [D]iagnostics")
map("n", "<leader>sr", Snacks.picker.resume, "[S]earch [R]esume")
map("n", "<leader>sp", Snacks.picker.projects, "[S]earch [P]rojects")
map("n", "<leader>s.", Snacks.picker.recent, '[S]earch Recent Files ("." for repeat)')
map("n", "<leader>s:", Snacks.picker.command_history, '[S]earch Cmd History (":" for cmd)')
