require("snacks").setup({
  bigfile = { enabled = false },
  dashboard = { enabled = false },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = false },
  words = { enabled = false },
})

Snacks.toggle.inlay_hints():map("<leader>ti")
Snacks.toggle.profiler():map("<leader>tp")

local function map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

map("n", "<leader><space>", Snacks.picker.buffers, "Find Buffers")
map("n", "<leader>/", Snacks.picker.grep, "Grep")
map("n", "<leader>e", Snacks.picker.explorer, "File Explorer")
map("n", "<leader>z", Snacks.picker.zoxide, "Zoxide")
map("n", "<leader>sf", Snacks.picker.files, "Search Files")
map("n", "<leader>sh", Snacks.picker.help, "Search Help")
map("n", "<leader>sk", Snacks.picker.keymaps, "Search Keymaps")
map("n", "<leader>sn", Snacks.picker.notifications, "Search Notifications")
map("n", "<leader>ss", Snacks.picker.pickers, "Search Select Picker")
map("n", "<leader>sl", Snacks.picker.highlights, "Search Highlights")
map("n", "<leader>sc", Snacks.picker.colorschemes, "Search Colorschemes")
map("n", "<leader>sd", Snacks.picker.diagnostics, "Search Diagnostics")
map("n", "<leader>sr", Snacks.picker.resume, "Search Resume")
map("n", "<leader>sp", Snacks.picker.projects, "Search Projects")
map("n", "<leader>s.", Snacks.picker.recent, "Search Recent Files")
map("n", "<leader>s:", Snacks.picker.command_history, "Search Cmd History")

map("n", "<leader>n", Snacks.notifier.show_history, "Show Notification History")
map({ "n", "t" }, "<C-\\>", Snacks.terminal.toggle, "Toggle Terminal")

map("n", "grn", vim.lsp.buf.rename, "LSP: Rename")
map({ "n", "x" }, "gra", vim.lsp.buf.code_action, "LSP: Goto Code Action")
map("n", "grr", Snacks.picker.lsp_references, "LSP: Goto References")
map("n", "gri", Snacks.picker.lsp_implementations, "LSP: Goto Implementation")
map("n", "grd", Snacks.picker.lsp_definitions, "LSP: Goto Definition")
map("n", "grD", vim.lsp.buf.declaration, "LSP: Goto Declaration")
map("n", "gO", Snacks.picker.lsp_symbols, "LSP: Open Document Symbols")
map(
  "n",
  "grW",
  Snacks.picker.lsp_workspace_symbols,
  "LSP: Open Workspace Symbols"
)
map("n", "grt", Snacks.picker.lsp_type_definitions, "LSP: Goto Type Definition")
