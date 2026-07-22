require("snacks").setup({
	bigfile = { enabled = false },
	dashboard = { enabled = false },
	explorer = { enabled = false },
	indent = { enabled = true },
	input = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = false },
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

map("n", "<leader>e", Snacks.picker.explorer, "[E]xplorer")
map("n", "<leader><space>", Snacks.picker.buffers, "Find Buffers")
map("n", "<leader>sf", Snacks.picker.files, "[S]earch [F]iles")
map("n", "<leader>sg", Snacks.picker.grep, "[S]earch by [G]rep")
map("n", "<leader>sh", Snacks.picker.help, "[S]earch [H]elp")
map("n", "<leader>sk", Snacks.picker.keymaps, "[S]earch [K]eymaps")
map("n", "<leader>sn", Snacks.picker.notifications, "[S]earch [N]otifications")
map("n", "<leader>ss", Snacks.picker.pickers, "[S]earch [S]election Pickers")
map("n", "<leader>sl", Snacks.picker.highlights, "[S]earch [H]ighlights")
map("n", "<leader>sc", Snacks.picker.colorschemes, "[S]earch [C]olorschemes")
map("n", "<leader>sd", Snacks.picker.diagnostics, "[S]earch [D]iagnostics")
map("n", "<leader>sr", Snacks.picker.resume, "[S]earch [R]esume")
map("n", "<leader>sp", Snacks.picker.projects, "[S]earch [P]rojects")
map("n", "<leader>s.", Snacks.picker.recent, "[S]earch Recent Files (.)")
map("n", "<leader>s:", Snacks.picker.command_history, "[S]earch Cmd History (:)")

map("n", "<leader>n", Snacks.notifier.show_history, "Show [N]otification History")
map({ "n", "t" }, "<C-\\>", Snacks.terminal.toggle, "Toggle Terminal")

map("n", "grn", vim.lsp.buf.rename, "LSP: Rename")
map({ "n", "x" }, "gra", vim.lsp.buf.code_action, "LSP: Goto Code Action")
map("n", "grr", Snacks.picker.lsp_references, "LSP: Goto References")
map("n", "gri", Snacks.picker.lsp_implementations, "LSP: Goto Implementation")
map("n", "grd", Snacks.picker.lsp_definitions, "LSP: Goto Definition")
map("n", "grD", vim.lsp.buf.declaration, "LSP: Goto Declaration")
map("n", "gO", Snacks.picker.lsp_symbols, "LSP: Open Document Symbols")
map("n", "grW", Snacks.picker.lsp_workspace_symbols, "LSP: Open Workspace Symbols")
map("n", "grt", Snacks.picker.lsp_type_definitions, "LSP: Goto Type Definition")
