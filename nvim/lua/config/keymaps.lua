-- Map up/down to visual line movements which avoids skipping wrapped lines
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Use <Esc> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set({ "n" }, "<A-h>", "<C-w>h")
vim.keymap.set({ "n" }, "<A-j>", "<C-w>j")
vim.keymap.set({ "n" }, "<A-k>", "<C-w>k")
vim.keymap.set({ "n" }, "<A-l>", "<C-w>l")

vim.keymap.set({ "n" }, "<leader>r", "<Cmd>restart<CR>", { desc = "Restart Neovim" })

vim.keymap.set({ "n" }, "<leader>ga", "<Cmd>Git diff --cached<CR>", { desc = "Added diff" })
vim.keymap.set({ "n" }, "<leader>gA", "<Cmd>Git diff --cached -- %<CR>", { desc = "Added diff buffer" })
vim.keymap.set({ "n" }, "<leader>gc", "<Cmd>Git commit<CR>", { desc = "Commit" })
vim.keymap.set({ "n" }, "<leader>gC", "<Cmd>Git commit --amend<CR>", { desc = "Commit amend" })
vim.keymap.set({ "n" }, "<leader>gd", "<Cmd>Git diff<CR>", { desc = "Diff" })
vim.keymap.set({ "n" }, "<leader>gD", "<Cmd>Git diff -- %<CR>", { desc = "Diff buffer" })
vim.keymap.set({ "n" }, "<leader>gl", "<Cmd>Git log<CR>", { desc = "Log" })
vim.keymap.set({ "n" }, "<leader>gL", "<Cmd>Git log<CR>", { desc = "Log buffer" })
vim.keymap.set({ "n" }, "<leader>go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", { desc = "Toggle overlay" })
vim.keymap.set({ "n" }, "<leader>gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", { desc = "Show at cursor" })

vim.keymap.set("x", "gs", "<Cmd>lua MiniGit.show_at_cursor()<CR>", { desc = "Show at selection" })
